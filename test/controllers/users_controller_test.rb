require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include Devise::TestHelpers

  def setup
    @user = users(:firstuser)
    sign_in(@user)
  end

  # test "should get index" do
  #   get users_index_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get users_show_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get users_edit_url
  #   assert_response :success
  # end

end
