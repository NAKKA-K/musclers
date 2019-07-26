require 'test_helper'

class HogeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hoge_show_url
    assert_response :success
  end

end
