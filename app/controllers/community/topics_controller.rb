class Community::TopicsController < ApplicationController
  include Wiki::Controllers::Sidebar::CommunitySidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Community

  before_filter :authenticate_user!,    :except => [:show, :index]
  load_and_authorize_resource
  
  def new
    @topic = Topic.new
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.community"), community_path)
    drop_breadcrumb(itext('topic.drop_breadcrumb_new'))
  end

  def show
    @topic = Topic.find(params[:id])
    @topic.change_read_history(current_user)
    drop_breadcrumb(itext("navigation.community"), community_path)
    drop_breadcrumb(itext("topic.drop_breadcrumb_view", :topic => @topic.name))
  end

  def edit
    @topic = Topic.find(params[:id])
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.community"), community_path)
    drop_breadcrumb(itext("topic.drop_breadcrumb_edit", :topic => @topic.name))
  end
  
  def create
    @topic = current_user.topics.new(model_params)
    if @topic.save
      redirect_to_as_create_success @topic
    else
      render_as_create_fail :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(model_params)
      redirect_to_as_update_success @topic
    else
      render_as_update_fail :edit
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    redirect_to_as_destroy_success "/community"
  end

  def follow
    @topic = Topic.find(params[:id])
    set_the_topic_follow_statu(true, @topic)
    respond_to do |format|
      format.js { render 'community/topics/follow', :layout => false }
    end
  end

  def unfollow
    @topic = Topic.find(params[:id])
    set_the_topic_follow_statu(false, @topic)
    respond_to do |format|
      format.js { render 'community/topics/unfollow', :layout => false }
    end
  end

  private

  def set_the_topic_follow_statu(status, topic)
    read_history = topic.topic_read_histories.find_by_user_id(current_user.id)
    read_history.update_attribute(:followed, status)
  end
end
  