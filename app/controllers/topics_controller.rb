class TopicsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :tag_index]

  load_and_authorize_resource

  def tag_index
    tag = Tag.find_by_id!(params[:tag_id])
    @topics = tag.topics.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
    render :index
  end

  def index
    @topics = Topic.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @topic.change_read_history(current_user)
  end

  def edit
    @topic = current_user.topics.find(params[:id])
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
    @topic = current_user.topics.find(params[:id])
    if @topic.update_attributes(model_params)
      redirect_to_as_update_success @topic
    else
      render_as_update_fail :edit
    end
  end

  def destroy
    current_user.topics.find(params[:id]).destroy
    redirect_to_as_destroy_success admin_topics_path
  end
end
