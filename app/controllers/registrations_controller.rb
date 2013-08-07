class RegistrationsController < Devise::RegistrationsController
  before_filter :check_query_params, only: [:new, :create]
  before_filter :set_params, only: :create

  protected

  def check_query_params
    if params[:email].blank? or params[:token].blank?
      redirect_to start_path
      return
    end

    @email = params[:email]
    @token = params[:token]

    if StartController.generate_email_token(@email) != @token
      redirect_to start_path
    end
  end

  def set_params
    params[:user][:email] = params[:email]
  end
end