module Wiki::Controllers::Check
  def lock
  begin
    @resource  = self.controller_model_type.camelize.constantize.find(params[:id])
  rescue
    @resource  = self.controller_model_type.camelize.constantize.find_by_number(params[:id]) unless @resource
  end
    @resource.record_timestamps = false
    @resource.update_attribute(:lock, true)
    @resource.record_timestamps = true
    respond_to do |format|
      format.html { redirect_to({ :controller => "admin/admin", :action => "#{@resource.model_type.pluralize}" }) }
      format.js { render "check/lock", :layout => false}
    end
  end

  def unlock
  begin
    @resource  = self.controller_model_type.camelize.constantize.find(params[:id])
  rescue
    @resource  = self.controller_model_type.camelize.constantize.find_by_number(params[:id]) unless @resource
  end
    @resource.record_timestamps = false
    @resource.update_attribute(:lock, false)
    @resource.record_timestamps = true
    respond_to do |format|
      format.html { redirect_to({:controller => "admin/admin", :action => "#{@resource.model_type.pluralize}" }) }
      format.js { render "check/unlock", :layout => false}
    end
  end
end