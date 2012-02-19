require 'test_helper'

class Users::SessionsControllerTest < ActionController::TestCase
  setup do
    @david = users(:david)
    @password = '123456'
  end

  test "login page" do
    get :new
    assert_response :success
  end

  test "login successfully" do
    assert session[:user_id] == nil, 'session user id is not nil, before login'
    post_login_request @david.account, @password
    assert session[:user_id] != nil, 'session user id is nil, after login'
    assert session[:user_id] == @david.id, 'session user id is diffrent with login user'
  end

  test "login failed, because pasword is wrong" do
    assert session[:user_id] == nil, 'session user id is not nil, before login'
    post_login_request @david.account, 'bad password'
    assert session[:user_id] == nil, 'session user id is not nil, fail login'
    assert_redirected_to login_path
  end

  test "login failed, because account is wrong" do
    assert session[:user_id] == nil, 'session user id is not nil, before login'
    post_login_request "bad account", @password
    assert session[:user_id] == nil, 'session user id is not nil, fail login'
    assert_redirected_to login_path
  end
  
  test "logout" do
    post_login_request @david.account, @password
    assert session[:user_id] != nil, 'session user id is nil, before logout'
    get :destroy
    assert session[:user_id] == nil, 'session user id is not nil, after logout'
    assert_redirected_to :root
  end

  def post_login_request(account, password)
    post :create, :user => {:account => account, :password => password}
  end
end