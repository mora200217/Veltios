require 'test_helper'

class ReserveItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reserve_items_create_url
    assert_response :success
  end

  test "should get update" do
    get reserve_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reserve_items_destroy_url
    assert_response :success
  end

end
