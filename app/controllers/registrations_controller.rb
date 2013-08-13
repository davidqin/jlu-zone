class RegistrationsController < Devise::RegistrationsController
  before_filter :check_query_params, only: [:new, :create]
  before_filter :set_params, only: :create

  def update
    @user = current_user
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

    @user = current_user

    if @user.update_password(params[:user])
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render :edit_password
    end
  end

  def edit_avatar
    authenticate_scope!
  end

  def update_avatar
    authenticate_scope!
    %w(a_x1 a_x2 a_y1 a_y2).each do |m|
      current_user.send("#{m}=", params[:user][m])
    end

    if current_user.update_attribute('avatar', params[:user][:avatar])
      redirect_to after_update_path_for(@user)
    else
      render :edit_avatar
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