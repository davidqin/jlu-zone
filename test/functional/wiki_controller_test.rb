require 'test_helper'
class WikiControllerTest < ActionController::TestCase
  test "root" do
    get :index
    assert_response :success
    assert_template "index"
  end
end
