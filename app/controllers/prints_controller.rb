# encoding: utf-8

class PrintsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_uncompleted_print, only: [:new, :create]
  # load_and_authorize_resource

  def index
    @prints = current_user.prints.where(is_completed: true).order("completed_at desc").limit(10)
    @uncompleted_print = current_user.uncompleted_print
  end

  def show
    @print = current_user.prints.find(params[:id])
  end

  def create
    @print = current_user.prints.new(params[:print])

    if @print.save
      redirect_to @print
    else
      redirect_to @print
    end
  end

  def complete
    @print = current_user.prints.find(params[:id])
    if @print.complete
      redirect_to action: :index
    else
      redirect_to action: :show
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @print = current_user.prints.find(params[:id])
    if @print.is_completed
      # 完成的不能删除
      redirect_to action: :index
    else
      @print.destroy
      redirect_to action: :index
    end
  end

  private

  def check_uncompleted_print
    if current_user.uncompleted_print
      redirect_to action: :index
    end
  end
end