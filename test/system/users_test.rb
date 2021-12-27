require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "sign up" do
    visit "/"
    click_on "Sign in with Google"

    assert_current_path new_user_path
    check I18n.t("users.form.terms_of_service")

    assert_difference("User.count") do
      click_on I18n.t("helpers.submit.create")
      assert_no_current_path new_user_path
    end

    user = User.first
    google = OmniAuth.config.mock_auth[:google_oauth2]

    assert_equal user.social_profiles.first.provider, google[:provider]
    assert_equal user.social_profiles.first.uid, google[:uid]
    assert_equal user.social_profiles.first.email, google[:info][:email]

    assert_current_path user_path(user)
  end
end
