require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "user", email: "user@email.com", password: "password")
  end

  test "should create article when logged in" do
    sign_in_as(@user)
    get new_article_url
    assert_response :success
    assert_select '.form-article'
    assert_match "Create a new article", response.body
    assert_difference 'Article.count', 1 do
      post articles_path params: { article: { title: "some title", description: "some description", user_id: @user } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Article was created successfuly", response.body
  end

  test "should not create article when logged out" do
    get new_article_url
    follow_redirect!
    assert_match "You must be logged in to perform that action", response.body
  end
end