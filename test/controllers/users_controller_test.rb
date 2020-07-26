require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    sign_in(@user)
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get show" do
    @user = users(:one)
    get user_path(@user[:id])
    assert_response :success
  end

  test "should get edit" do
    @user = users(:one)
    get edit_user_path(@user[:id])
    assert_response :success
  end

end
