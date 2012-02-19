class ApplicationController < ActionController::Base
  attr_accessor :current_user

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    render "/permission_error"
  end
end
