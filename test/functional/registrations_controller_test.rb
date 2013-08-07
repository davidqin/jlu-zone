# coding: utf-8
require 'test_helper'
class RegistrationsControllerTest < ActionController::TestCase

  setup do
    @email = 'davidqhr@gmail.com'
    @token = StartController.generate_email_token(@email)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
  end

  test '有email和token才能 get new' do
    get :new
    assert_response 302
    assert_redirected_to start_path

    get :new, email: @email, token: @token
    assert_response 200
    assert_template 'devise/registrations/new'

    post :create
    assert_response 302
    assert_redirected_to start_path
  end

  test 'edit' do
    get :edit
    assert_response 302

    sign_in @user
    get :edit
    assert_template :edit
  end

  test 'update' do
    sign_in @user
    assert @user.nickname != 'lulu'

    put :update, user: { nickname: 'lulu' }
    assert @user.reload.nickname == 'lulu'

    assert_response 302

    put :update, user: { nickname: '' }
    assert_response 200
    assert_template :edit
  end

  test 'edit_password' do
    get :edit_password
    assert_response 302

    sign_in @user
    get :edit_password
    assert_template :edit_password
  end
end