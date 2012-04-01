class FollowedResourcesController < ApplicationController
  before_filter :authenticate_user!
  #load_and_authorize_resource
  def create
    if current_user.followed_resources.create_followed_resource(params, current_user)
      render_result true
    else
      render_result false
    end
  end

  def destroy
    if current_user.followed_resources.destroy_followed_resource(params, current_user)
      render_result true
    else
      render_result false
    end    
  end

  def render_result(result)
    respond_to do |format|
      format.json {render :json => {:success => result}}
    end
  end
end
