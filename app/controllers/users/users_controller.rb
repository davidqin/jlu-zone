class Users::UsersController < ApplicationController
  include Wiki::Controllers::Sidebar::UserSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Users

  def menu
    @users = User.all
    do_not_use_sidebar
    drop_breadcrumb(itext("user.menu"))
    render "/users/menu"
  end
  
  def show
    @user = User.find_by_number(params[:id])
    drop_breadcrumb(itext("user.menu"),users_path)
    drop_breadcrumb(@user.nickname)
    render "/users/show"    
  end

  def topics
    @user = User.find_by_number(params[:id])
    @topics = @user.topics.paginate(:page => params[:page], :per_page => 30)
    render "/users/topics"
  end

  def follows
    @user = User.find_by_number(params[:id])
    binding.pry
    @follows = @user.followed_resources.topics.paginate(:page => params[:page], :per_page => 30)
    render "/users/follows"
  end

  def location
    @users = User.find(:all, :conditions => ["campus = ?", params[:campus]]).paginate(:page => params[:page], :per_page => 10)
    render "/users/location" 
  end
end
