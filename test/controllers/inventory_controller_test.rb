require 'test_helper'

class InventoryControllerTest < ActionController::TestCase
  test "should get inventory" do
    get :inventory
    assert_response :success
  end

end
