# coding: utf-8
require 'test_helper'
class RegistrationsControllerTest < ActionController::TestCase

  setup do
    @email = 'davidqhr@gmail.com'
    @token = StartController.generate_email_token(@email)
    @request.env["devise.mapping"] = Devise.mappings[:user]
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
end