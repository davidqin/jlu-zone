class SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication
  def new
    resource = build_resource
    clean_up_passwords(resource)
    # respond_with(resource, serialize_options(resource))
    render "devise/sessions/new_dialog", :layout => false
  end

  def create
    super
  end

  def after_sign_in_path_for
    render 'devise/sessions/new_dialog', :layout => false
  end
end