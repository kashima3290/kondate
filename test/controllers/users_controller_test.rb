require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:firstuser)
    sign_in(@user)
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  # test "should get show" do
  #   get users_show_url
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_user_path(current_user.id)
    assert_response :success
  end

end
