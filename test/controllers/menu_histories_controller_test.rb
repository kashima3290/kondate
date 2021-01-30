require 'test_helper'

class MenuHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menu_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get menu_histories_show_url
    assert_response :success
  end

  test "should get edit" do
    get menu_histories_edit_url
    assert_response :success
  end

  test "should get delete" do
    get menu_histories_delete_url
    assert_response :success
  end

  test "should get create" do
    get menu_histories_create_url
    assert_response :success
  end

end
