require 'test_helper'
class StartControllerTest < ActionController::TestCase

  test 'form' do
    get :form
    assert_template :form
  end
end