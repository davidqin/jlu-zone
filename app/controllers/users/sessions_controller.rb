class Users::SessionsController < ApplicationController
  def new
  end
  
  def create
    hashed_password = User.encrypt_password(params[:user][:password])
    user = User.find_by_name_and_hashed_password(params[:user][:name], hashed_password)
    if user == nil
      flash[:login] = itext('user.login_fail')
      redirect_to login_path
      return
    end

    session[:user_id] = user.id
    self.current_user = user
    flash[:notice] = itext('user.login_success')
    redirect_to :root
  end
  
  def destroy
    reset_session
    flash[:notice] = itext('user.logout_success')
    redirect_to :root
  end
end