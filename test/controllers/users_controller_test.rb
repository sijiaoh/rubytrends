require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should raise error when get new without omniauth" do
    assert_raises StandardError do
      get new_user_url
    end
  end

  test "should raise error when create user without omniauth" do
    assert_raises StandardError do
      post users_url, params: { user: { terms_of_service: "1" } }
    end
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end
end
