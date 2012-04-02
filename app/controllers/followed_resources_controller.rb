class FollowedResourcesController < ApplicationController
  before_filter :authenticate_user!
  #load_and_authorize_resource
  def create
    id        = params[:resource_id]
    @resource = (params[:resource_type]).constantize.find(id)
    current_user.followed_resources.create_followed_resource(@resource, current_user)
    respond_to do |format|
      format.js { render "followed/follow", :layout => false}
    end
  end

  def destroy
    id        = params[:resource_id]
    @resource = (params[:resource_type]).constantize.find(id)
    current_user.followed_resources.destroy_followed_resource(@resource, current_user)
    respond_to do |format|
      format.js { render "followed/unfollow", :layout => false}
    end
  end
end
