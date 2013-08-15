class RepliesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def create
    subject = params[:subject_type].to_s.camelize.constantize.find(params[:subject_id])

    reply = subject.replies.new(params[:reply])
    reply.fonder_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { render "_reply", locals: { reply: reply }, layout: false, status: 200 }
      else
        format.html { render :text => @reply.errors.full_messages.join(','), :status => 406, :layout => false }
      end
    end
  end

  def edit
    @reply = current_user.replies.find(params[:id])
  end

  def update
    @reply = current_user.replies.find(params[:id])
    if @reply.update_attributes(params[:reply])
      redirect_to_as_update_success @reply.subject
    else
      render_as_update_fail :edit
    end
  end
end