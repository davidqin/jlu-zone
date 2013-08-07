require 'digest'
require 'yaml'

USER_START_EMAIL_SALT = YAML.load_file('config/config.yml').user_start_email_salt

class StartController < ApplicationController
  def form
  end

  def send_email
    @email_address = params[:email]
    @email_token = Digest::SHA256.hexdigest(@email_address + USER_START_EMAIL_SALT)
    render "sent_email"
  end
end