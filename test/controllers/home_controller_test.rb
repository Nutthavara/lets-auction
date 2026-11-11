require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "root page loads successfully" do
    get root_url

    assert_response :success
    assert_select "h1", "Let's Auction"
  end
end
