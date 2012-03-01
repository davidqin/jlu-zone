class EntriesController < ApplicationController
  
  before_filter :find_current_category

  attr_accessor :current_category
  
  helper_method :current_category

  def index
    @entries = current_category.entries.all
  end

  def show
    @entry = current_category.entries.find(params[:id])
  end

  def edit
    @entry = current_category.entries.find(params[:id])
  end

  def new
    @entry = current_category.entries.new
  end

  def create
    @entry = current_category.entries.create_entry(current_user, params)
    if @bill.save
      #redirect_to_as_create_success [current_company, @bill]
    else
      #render_as_create_fail "bills/bills/new"
    end
  end
  
  def update
    @entry = current_category.entries.find(params[:id])
    if @entry.update_entry(params)
     # redirect_to_as_update_success [current_company, @bill]
    else
      #render_as_update_fail "bills/bills/edit"
    end
  end

  def destroy
    current_category.entries.find(params[:id]).destroy
  end

  protected

  def find_current_category
    self.current_category = Category.find_by_number(params[:category_number])
    unless self.current_category
      raise "Can not find a Category with the number #{params[:category_number]}"
    end
  end
end