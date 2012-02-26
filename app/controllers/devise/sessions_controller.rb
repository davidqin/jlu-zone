class Devise::SessionsController < DeviseController
  def login_dialog
    render "/devise/sessions/new_dialog", :layout => false
  end
end
