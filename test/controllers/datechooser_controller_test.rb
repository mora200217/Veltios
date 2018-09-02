require 'test_helper'

class DatechooserControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get datechooser_select_url
    assert_response :success
  end

end
