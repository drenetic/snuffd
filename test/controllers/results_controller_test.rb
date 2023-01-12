require "test_helper"

class ResultsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get show" do
    get results_show_url
    assert_response :success
  end

  test "should get authenticate_link" do
    get results_authenticate_link_url
    assert_response :success
  end
>>>>>>> master
end
