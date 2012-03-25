class Community::TopicsController < ApplicationController
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Community
  def new
    @topic = Topic.new
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.community"), community_path)
    drop_breadcrumb(itext('topic.drop_breadcrumb_new'))
  end

  def show
    @topic = Topic.find(params[:id])
    do_not_use_sidebar
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
end
  