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
    assert_difference('User.count') do
      post :create, :user => @roshan
    end
    assert_redirected_to :root
    assert new_user = User.find_by_name(@roshan[:name]), "Register user did not save"
    #login is still empty
    #assert_equal session[:user_id], new_user.id , "Session user id is different with register user id"    
  end

  test "register successfully wiht every field" do
    user = {
      :nickname   => 'test',
      :campus     => 'test',
      :department => 'test',
      :major      => 'test',
      :grade      => 'test',
      :renren     => 'test',
      :qq         => 'test',
      :email      => 'test',
      :idiograph  => 'test'
    }
    assert_difference('User.count') do
      post :create, :user => @roshan.merge(user)
    end
    assert_redirected_to :root
    assert new_user = User.find_by_name(@roshan[:name]), "Register user did not save"
    #login is still empty
    #assert_equal session[:user_id], new_user.id , "Session user id is different with register user id"    
  end

  test "register failed, name is empty" do
    assert_registration_failed :name => ''
  end

  test "register failed, password is empty" do
    assert_registration_failed :password => '', :password_confirmation => ''
    assert_registration_failed :password => ''
    assert_registration_failed :password_confirmation => ''
  end

  test "register failed, password length is wrong" do
    shor_password = '012'
    assert_registration_failed :password => shor_password, :password_confirmation => shor_password
    long_password = '0123456789012345678901234567890123456789'
    assert_registration_failed :password => long_password, :password_confirmation => long_password
  end

  test "register failed, password not match confirmation" do
    assert_registration_failed :password => '12345678', :password_confirmation => '123456789'
  end

  def assert_registration_failed(user)
    assert_no_difference "User.count", "register should be failed" do
      post :create, :user => @roshan.merge(user)
    end
  end
end
