require 'test_helper'

class Users::UsersControllerTest < ActionController::TestCase
  setup do
    @roshan = {
      :name => 'roshan',
      :password => '123456',
      :password_confirmation => '123456'}
  end
  
  test "register page" do
    get :new
    assert_response :success
  end

  test "register successfully" do
     ('User.count') do
      post :create, :user => @leon
    end
    assert_redirected_to new_company_path    
    assert new_user = User.find_by_email(@leon[:email]), "Register user did not save"
    assert_equal session[:user_id], new_user.id , "Session user id is different with register user id"    
  end

  test "register failed, because email is empty" do
    assert_registration_failed :email => ''
  end

  test "register failed, because name is empty" do
    assert_registration_failed :name => ''
  end

  test "register failed, because password is empty" do
    assert_registration_failed :password => '', :password_confirmation => ''
    assert_registration_failed :password => ''
    assert_registration_failed :password_confirmation => ''
  end

  test "register failed, because email is wrong" do
    assert_registration_failed :email => 'bademail'
  end

  test "register failed, because password length is wrong" do
    shor_password = '012'
    assert_registration_failed :password => shor_password, :password_confirmation => shor_password
    long_password = '0123456789012345678901234567890123456789'
    assert_registration_failed :password => long_password, :password_confirmation => long_password
  end

  test "register failed, because password is not match wit confirmation" do
    assert_registration_failed :password => '12345678', :password_confirmation => '123456789'
  end

  def assert_registration_failed(user)
    assert_session_user_id_nil
    assert_no_difference "User.count", "register should be failed" do
      post :create, :user => @leon.merge(user)
    end
    assert_session_user_id_nil
  end
end
