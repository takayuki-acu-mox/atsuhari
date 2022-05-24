require 'test_helper'

class TherapiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get therapies_index_url
    assert_response :success
  end

end
