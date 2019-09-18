require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get show_top_url
    assert_response :success
  end

end
