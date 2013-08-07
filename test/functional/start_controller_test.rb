require 'test_helper'
class StartControllerTest < ActionController::TestCase

  test 'form' do
    get :form
    assert_template :form
  end

  test 'send_email' do
    email = 'davidqhr@gmail.com'

    assert_difference -> {ActionMailer::Base.deliveries.count}, 1 do
      post :send_email, :email => email
    end

    assert_equal email, assigns(:email_address)
    assert_template :sent_email
  end
end