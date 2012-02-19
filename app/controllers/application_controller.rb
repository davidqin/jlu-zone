class ApplicationController < ActionController::Base
  attr_accessor :current_user

  helper_method :current_user
end
