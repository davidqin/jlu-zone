class Users::UsersController < ApplicationController
  def menu
    @users = User.all
    drop_breadcrumb(itext("user.menu"))
    render "/users/menu"
  end
  
  def show
    @user = User.find(params[:id])
    drop_breadcrumb(@user.nickname)
    render "/users/show"
  end
end
