require "test_helper"

class SignInControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sign_in_path
    assert_response :success
  end
end
