require 'test_helper'

class ElementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get elements_index_url
    assert_response :success
  end

end
