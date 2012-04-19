class Admin::AdminController < ApplicationController
  include Wiki::Controllers::Sidebar::AdminSidebar
  before_filter :check_permission

  def index
    render 'admin/index'
  end

  def users
    @users = User.all.paginate(:page => params[:page], :per_page => 20 )
    render 'admin/users'
  end

  def tags
    @tags = Tag.all.paginate(:page => params[:page], :per_page => 20 )
    render 'admin/tags'
  end

  def topics
    @topics = Topic.order("created_at desc").all.paginate(:page => params[:page], :per_page => 20 )
    render 'admin/topics'
  end

  def entries
    @entries = Entry.order("created_at desc").all.paginate(:page => params[:page], :per_page => 20 )
    render 'admin/entries'
  end

  private

  def check_permission
    redirect_to :root unless current_user
    redirect_to :root unless current_user.admin_permission
  end
end
