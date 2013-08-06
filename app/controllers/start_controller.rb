class StartController < ApplicationController
  def form
  end

  def send_email
    @email_address = params[:email]
    render "sent_email"
  end
end