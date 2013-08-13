class PrintsController < ApplicationController
  before_filter :authenticate_user!
  # load_and_authorize_resource

  def index
  end

  def new
    @print = current_user.prints.new
  end

  def show
    @print = current_user.prints.find(params[:id])
  end

  def create
    @print = current_user.prints.new(params[:print])

    @print.deadline = Time.new + 10.days

    if @print.save
      redirect_to @print
    else
      render :show
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end