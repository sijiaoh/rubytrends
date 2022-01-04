require "rails_helper"

RSpec.describe "authentication", type: :system do
  before { skip }

  it "sign up" do
    visit sign_in_path
    expect(page).to have_current_path sign_in_path
    click_on I18n.t("session.new.with_google")
    expect(page).to have_current_path sign_up_path

    expect do
      check User.human_attribute_name(:terms_of_service)
      click_on I18n.t("helpers.submit.create")
      expect(page).not_to have_current_path sign_up_path
    end.to change(User, :count).by(1).and change(SocialProfile, :count).by(1)

    user = User.first
    social_profile = user.social_profiles.first
    google = OmniAuth.config.mock_auth[:google_oauth2]
    expect(social_profile.provider).to eq google[:provider]
    expect(social_profile.uid).to eq google[:uid]
    expect(social_profile.email).to eq google[:info][:email]

    expect(page).to have_button I18n.t("sign_out")
  end

  it "sign in" do
    google = OmniAuth.config.mock_auth[:google_oauth2]
    user = User.build_with_social_profile({}, google)
    user.save!

    visit sign_in_path
    click_on I18n.t("session.new.with_google")
    expect(page).to have_current_path root_path
    expect(page).to have_button I18n.t("sign_out")
  end

  it "sign out" do
    user = create :user
    sign_in user

    visit root_path
    expect(page).to have_button I18n.t("sign_out")

    click_on I18n.t("sign_out")
    expect(page).not_to have_button I18n.t("sign_out")
  end
end
