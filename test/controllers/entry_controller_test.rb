require 'test_helper'

class EntryControllerTest < ActionController::TestCase
  test "should get put_moving" do
    get :put_moving
    assert_response :success
  end

end
