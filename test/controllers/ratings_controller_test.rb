require "test_helper"

class RatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get score:integer" do
    get ratings_score:integer_url
    assert_response :success
  end
end
