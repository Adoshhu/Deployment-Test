require "test_helper"

class FoldersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get folders_new_url
    assert_response :success
  end

  test "should get index" do
    get folders_index_url
    assert_response :success
  end

  test "should get edit" do
    get folders_edit_url
    assert_response :success
  end

  test "should get show" do
    get folders_show_url
    assert_response :success
  end

  test "should get destroy" do
    get folders_destroy_url
    assert_response :success
  end
end
