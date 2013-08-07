require 'digest'
require 'yaml'

USER_START_EMAIL_SALT = YAML.load_file('config/config.yml')["user_start_email_salt"]

class StartController < ApplicationController

  def self.generate_email_token email
    Digest::SHA256.hexdigest(email + USER_START_EMAIL_SALT)
  end

  def form
  end

  def send_email
    @email_address = params[:email]
    email_token = StartController.generate_email_token(@email_address)
    render "sent_email"
  end
end