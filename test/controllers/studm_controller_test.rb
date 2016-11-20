require 'test_helper'

class StudmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get studm_index_url
    assert_response :success
  end

  test "should get create" do
    get studm_create_url
    assert_response :success
  end

  test "should get update" do
    get studm_update_url
    assert_response :success
  end

  test "should get search" do
    get studm_search_url
    assert_response :success
  end

  test "should get delete" do
    get studm_delete_url
    assert_response :success
  end

end
