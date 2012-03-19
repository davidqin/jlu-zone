class Replies::RepliesController < ApplicationController
  before_filter :authenticate_user!,    :except => [:index]
  load_and_authorize_resource

  def create
    resource = params[:resource_type].to_s.camelize.constantize.find(params[:resource_id])
    @reply = resource.replies.new(params[:reply])
    @reply.user_id = current_user.id
    respond_to do |format|
      if @reply.save
        format.html { redirect_to_as_create_success resource }
        format.js { render 'replies/create', :layout => false }
      else
        format.html { render_as_create_fail :new }
        format.js { render :text => @reply.errors.full_messages.join(','), :status => 406, :layout => false }
      end
    end
  end

  def edit

  end

  def update

  end
  private

end