require 'test_helper'

class LoginSystemControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get userInfo" do
    get :userInfo
    assert_response :success
  end

end
