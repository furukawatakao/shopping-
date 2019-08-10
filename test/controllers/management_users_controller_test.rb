require 'test_helper'

class ManagementUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_users_index_url
    assert_response :success
  end

  test "should get new" do
    get management_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get management_users_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get management_users_destroy_url
    assert_response :success
  end

end
