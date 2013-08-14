class PrintsController < ApplicationController
  before_filter :authenticate_user!
  # load_and_authorize_resource

  def index
    @prints = current_user.prints.where(is_completed: true).order("completed_at desc").limit(10)
    @uncompleted_print = current_user.prints.where(is_completed: false).all.first
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

  def complete
    @print = current_user.prints.find(params[:id])
    @print.complete!
    redirect_to action: :index
  end

  def edit
  end

  def update
  end

  def destroy
    @print = current_user.prints.find(params[:id])
    if @print.is_completed
      redirect_to action: :index
    else
      @print.destroy
      redirect_to action: :index
    end
  end
end