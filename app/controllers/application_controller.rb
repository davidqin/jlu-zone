class ApplicationController < ActionController::Base
  protect_from_forgery
  include Wiki::Controllers::ActionResult

  attr_accessor :catalog_type
  helper_method :catalog_type

  protected

  def model_params
    self.params[self.controller_model_type] || {}
  end  

  def controller_model_type
    self.controller_name.singularize.to_s
  end
end
