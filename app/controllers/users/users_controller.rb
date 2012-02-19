class Users::UsersController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = itext('user.register_success')
      redirect_to :root
    else
      flash.now[:error] = itext('user.register_fail')
      render :new
    end    
  end
end