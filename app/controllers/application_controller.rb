class ApplicationController < ActionController::Base
  before_filter :get_base_categories
  protect_from_forgery

  protected

  def get_base_categories
    @base_categories = Category.find(:all, :conditions => "parent_id is null")
  end
  
end
