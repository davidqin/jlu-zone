class FollowedResourcesController < ApplicationController
  before_filter :authenticate_user!

  def create
    id = params[:resource_id]
    @resource = (params[:resource_type]).constantize.find(id)
    current_user.followed_resources.create_followed_resource(@resource, current_user)
    respond_to do |format|
      format.js { render json: { status: :success } }
    end
  end

  def destroy
    id = params[:resource_id]
    @resource = (params[:resource_type]).constantize.find(id)
    current_user.followed_resources.destroy_followed_resource(@resource, current_user)
    respond_to do |format|
      format.js { render json: { status: :success } }
    end
  end
end
