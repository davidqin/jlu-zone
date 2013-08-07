class RegistrationsController < Devise::RegistrationsController
  before_filter :check_query_params, only: [:new, :create]
  before_filter :set_params, only: :create

  def update
    @user = User.find(current_user.id)
    params[:user].delete(:current_password)

    if @user.update_without_password(params[:user])
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def edit_password
    authenticate_scope!
  end

  def update_password
    authenticate_scope!

    @user = User.find(current_user.id)

    if @user.update_password(params[:user])
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit_password"
    end
  end

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