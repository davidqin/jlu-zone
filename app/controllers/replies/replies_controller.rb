class Replies::RepliesController < ApplicationController
  before_filter :authenticate_user!,    :except => [:index]
  load_and_authorize_resource

  def create
    binding.pry
    resource = params[:resource_type].to_s.camelize.constantize.find(params[:resource_id])
    @reply = resource.replies.new(params[:reply])
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to_as_create_success resource
    else
      render_as_create_fail :new
    end
  end

  def edit

  end

  def update

  end
  private

end