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
end
