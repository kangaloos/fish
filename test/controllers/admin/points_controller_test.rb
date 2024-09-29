require "test_helper"

class Admin::PointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_points_index_url
    assert_response :success
  end
end
