class Users::UsersController < ApplicationController
  include Wiki::Controllers::Sidebar::UserSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Users
  include Wiki::Controllers::Check

  def menu
    @new_users = User.order("created_at desc").limit(20)
    @active_users = User.order("score desc").limit(20)
    do_not_use_sidebar
    drop_breadcrumb(itext("user.menu"))
    render "/users/menu"
  end
  
  def show
    @user = User.find_by_number(params[:id])
    @replies = @user.replies.where(["resource_type = ?", "Topic"]).order("created_at DESC").limit(10).all
    drop_breadcrumb(itext("user.menu"),users_path)
    drop_breadcrumb(@user.nickname)
    render "/users/show"    
  end

  def topics
    @user = User.find_by_number(params[:id])
    @topics = @user.topics.all.paginate(:page => params[:page], :per_page => 10)
    drop_breadcrumb(itext("user.menu"),users_path)
    drop_breadcrumb(@user.nickname, user_path(@user))
    drop_breadcrumb(itext("user.topic_publish"))
    render "/users/topics"
  end

  def follows
    @user = User.find_by_number(params[:id])
    @follows = @user.followed_topics.order("created_at DESC").all.paginate(:page => params[:page], :per_page => 10)
    drop_breadcrumb(itext("user.menu"),users_path)
    drop_breadcrumb(@user.nickname, user_path(@user))
    drop_breadcrumb(itext("user.user_follows"))
    render "/users/follows"
  end

  def location
    @users = User.find(:all, :conditions => ["campus = ?", params[:campus]]).paginate(:page => params[:page], :per_page => 10)
    render "/users/location" 
  end

  def set_permission
    @user = User.find_by_number(params[:id])
    @permission = params[:permission]
    @user.update_attribute(@permission, true)
    respond_to do |format|
      format.js { render "admin/set_user_permission", :layout => false}
    end
  end

  def cancel_permission
    @user = User.find_by_number(params[:id])
    @permission = params[:permission]
    @user.update_attribute(@permission, false)
    respond_to do |format|
      format.js { render "admin/cancel_user_permission", :layout => false}
    end
  end
end
