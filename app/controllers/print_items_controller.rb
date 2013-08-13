class PrintItemsController < ApplicationController
  before_filter :authenticate_user!

  def create
    print = current_user.prints.find(params[:print_id])
    print_item = print.items.create!
    respond_to do |format|
      format.html { render "prints/_print_item", locals: { print_item: print_item }, layout: false}
    end
  end

  def update
    print = current_user.prints.find(params[:print_id])
    print_item = print.items.find(params[:id])
    print_item.update_attribute('format', params[:print_item][:format])
    respond_to do |format|
      format.json { render json: { result: :success, format: params[:print_item][:format]} }
    end
  end

  def destroy
    print = current_user.prints.find(params[:print_id])
    print_item = print.items.find(params[:id])
    print_item.destroy
    respond_to do |format|
      format.json { render json: { result: :success } }
    end
  end
end