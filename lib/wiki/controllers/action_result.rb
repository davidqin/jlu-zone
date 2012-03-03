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

  def render_bills_view(file)
    render "bills/bills/#{file}"
  end
  
  def render(*args)
    if params[:dialog]
      render_for_dialog(args)
    end
    super *args
  end

  def render_for_dialog(args)
    layout_option = {:layout => false}
    hash_list = args.select {|item| item.is_a?(Hash)}
    if hash_list.count == 0
      args << layout_option
    else
      hash_list.first.merge! layout_option
    end
  end
end