class Replies::RepliesController < ApplicationController
  before_filter :authenticate_user!,    :except => [:index]
  load_and_authorize_resource

  def create
    
  end

  def edit

  end

  def update

  end
  private

end