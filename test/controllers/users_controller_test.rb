require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  # サインアップ検証
  def setup
    @user = users(:one)
    sign_in(@user)
  end

  # ログイン
  def test_new
    @user = users(:one)
    login_as(@user, scope: :user)
    get root_path
    assert_response :success
  end

  # ユーザー一覧 get
  test "should get index" do
    get users_path
    assert_response :success
  end

  # ユーザー詳細 get
  test "should get show" do
    @user = users(:one)
    get user_path(@user[:id])
    assert_response :success
  end

  # ユーザー情報編集 get
  test "should get edit" do
    @user = users(:one)
    get edit_user_url(@user[:id])
    assert_response :success
  end

  # ユーザー情報更新 get
  test "should get update" do
    @user = users(:one)
    get users_update_url(@user[:id])
    assert_response :success
  end

end
