require "test_helper"

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get results_show_url
    assert_response :success
  end

  test "should get authenticate_link" do
    get results_authenticate_link_url
    assert_response :success
  end
end
