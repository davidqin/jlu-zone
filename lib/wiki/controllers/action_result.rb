module Wiki::Controllers::ActionResult
  def redirect_to_as_create_success(options)
    flash[:notice] = itext(:create_success)
    redirect_to options
  end

  def redirect_to_as_destroy_success(options = {:action => :index})
    flash[:notice] = itext(:destroy_success)
    redirect_to options
  end

  def redirect_to_as_update_success(options)
    flash[:notice] = itext(:update_success)
    redirect_to options
  end

  def render_as_create_fail(options = :new)
    flash.now[:error] = itext(:create_fail)
    render options
  end

  def render_as_update_fail(options = :edit)
    flash.now[:error] = itext(:update_fail)
    render options
  end
end