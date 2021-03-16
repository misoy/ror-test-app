require "test_helper"

class SignUpUserTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "user", email: "user@gmail.com", password: "password")
  end

  test "should sign up user with valid credentials" do
    get signup_url
    assert_response :success
    post users_path params: { user: { username: "user1", email: "user1@gmail.com", password: "password" } }
    follow_redirect!
    assert_response :success
    assert_match "you have successfuly signed up", response.body
  end

  test "should decline user with blank fields" do
    get signup_url
    assert_response :success
    post users_path params: { user: { username: "", email: "", password: "" } }
    assert_match "Username can&#39;t be blank", response.body
    assert_match "Email can&#39;t be blank", response.body
    assert_match "Password can&#39;t be blank", response.body
  end

  test "should decline user with taken username and email " do
    get signup_url
    assert_response :success
    post users_path params: { user: { username: @user.username, email: @user.email,  password: @user.password } }
    assert_match "Username has already been taken", response.body
    assert_match "Email has already been taken", response.body
  end
end
