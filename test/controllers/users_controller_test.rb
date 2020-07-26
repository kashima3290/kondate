require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  # サインアップ検証
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  # ログイン
  test "test_new" do
    login_as(@user)
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
    get user_url(@user[:id])
    assert_response :success
  end

  # ユーザー情報編集 get
  test "should get edit" do
    get edit_user_url(@user[:id])
    assert_response :success
  end

  # ユーザー情報更新 patch
  test "should patch update" do
    patch user_url(@user), params: {user: {name: "new", profile: "updated"}}
    @user.reload.profile
    assert_equal "updated", @user.profile
  end

  # ログアウト
  test "sign out" do
    sign_out(@user)
    get new_user_session_path
    assert_response :success
  end

end
