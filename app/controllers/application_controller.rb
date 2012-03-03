class ApplicationController < ActionController::Base
  include Wiki::Controllers::ActionResult

  before_filter :get_base_categories
  before_filter :get_navigation_category
  protect_from_forgery

  protected

  def get_base_categories
    @base_categories = Category.find(:all, :conditions => "parent_id is null")
  end

  def get_navigation_category
    return unless params[:category_number]
    @navigation_category = Category.find_by_number(params[:category_number])
  end

  def model_params
    self.params[self.controller_model_type] || {}
  end  

  def controller_model_type
    self.controller_name.singularize.to_s
  end
end
