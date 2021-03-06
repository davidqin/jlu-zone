# encoding: utf-8

class PrintItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_print

  def create
    print_item = @print.items.create!
    respond_to do |format|
      format.html { render "prints/_print_item", locals: { print_item: print_item }, layout: false}
    end
  end

  def update
    print_item = @print.items.find(params[:id])
    respond_to do |format|
      if print_item.update_attributes(params[:print_item])
        format.json { render json: { result: :success, format: print_item.format } }
      else
        format.json { render json: { result: :field, errors: print_item.errors } }
      end
    end
  end

  def destroy
    print_item = @print.items.find(params[:id])
    print_item.destroy
    respond_to do |format|
      format.json { render json: { result: :success } }
    end
  end

  private

  def find_print
    @print = current_user.prints.find(params[:print_id])
  end
end