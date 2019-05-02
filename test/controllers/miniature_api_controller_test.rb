require 'test_helper'

class MiniatureApiControllerTest < ActionDispatch::IntegrationTest
  test "should get getMinis" do
    get miniature_api_getMinis_url
    assert_response :success
  end

  test "should get voteMinis" do
    get miniature_api_voteMinis_url
    assert_response :success
  end

end
