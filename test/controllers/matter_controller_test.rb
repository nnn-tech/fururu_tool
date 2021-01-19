require 'test_helper'

class MatterControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get matter_test_url
    assert_response :success
  end

end
