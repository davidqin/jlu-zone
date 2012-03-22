class Users::UsersController < ApplicationController
  include Wiki::Controllers::Sidebar::UserSidebar
  def menu
    @users = User.all
    do_not_use_sidebar
    drop_breadcrumb(itext("user.menu"))
    render "/users/menu"
  end
  
  def show
    @user = User.find_by_nickname(params[:id])
    drop_breadcrumb(itext("user.menu"),users_path)
    drop_breadcrumb(@user.nickname)
    render "/users/show"    
  end

  def notices
    user = User.find_by_nickname(params[:id])
    @notices = user.notices
    render "/users/notices"
  end
end
