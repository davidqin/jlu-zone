class UsersController < ApplicationController
  def menu
    @users = User.all
    drop_breadcrumb(itext("user.menu"))
    render "menu"
  end
  
  def show
    @user = User.find(params[:id])
    drop_breadcrumb(@user.nickname)
  end
end