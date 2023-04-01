require "test_helper"

class NormalPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get normal_pages_index_url
    assert_response :success
  end
end
