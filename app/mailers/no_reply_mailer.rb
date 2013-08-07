# coding: utf-8
class NoReplyMailer < ActionMailer::Base
  default from: "test@jlu-zone.com"

  def confirm(email, token)
    @url = new_user_registration_url(email: email, token: token)
    mail to: email, :subject => "邮箱认证"
  end
end
