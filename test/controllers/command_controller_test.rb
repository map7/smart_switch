require 'test_helper'

class CommandControllerTest < ActionController::TestCase
  test "should get cmd" do
    get :cmd
    assert_response :success
  end

end
