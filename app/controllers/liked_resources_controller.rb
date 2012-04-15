class LikedResourcesController < ApplicationController
  before_filter :authenticate_user!
  #load_and_authorize_resource
  def create
    id        = params[:resource_id]
    @resource = (params[:resource_type]).constantize.find(id)
    current_user.liked_resources.create_liked_resource(@resource, current_user)
    respond_to do |format|
      format.js { render "liked/like", :layout => false}
    end
  end

  def destroy
    id        = params[:resource_id]
    @resource = (params[:resource_type]).constantize.find(id)
    current_user.liked_resources.destroy_liked_resource(@resource, current_user)
    respond_to do |format|
      format.js { render "liked/unlike", :layout => false}
    end
  end
end
