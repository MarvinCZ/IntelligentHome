require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
