require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "sign up" do
    visit "/"
    click_on "Sign in with Google"

    assert_current_path new_user_path
    check I18n.t("users.form.terms_of_service")

    assert_difference("User.count") do
      click_on I18n.t("helpers.submit.create")
      assert_current_path /#{user_path("*")}/
    end

    user = User.first
    assert_current_path user_path(user)
  end
end
