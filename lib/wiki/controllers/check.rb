module Wiki::Controllers::Check
  def lock
    @resource  = self.controller_model_type.camelize.constantize.find(params[:id])
    @resource.record_timestamps = false
    @resource.update_attribute(:lock, true)
    @resource.record_timestamps = true
    respond_to do |format|
      format.js { render "check/lock", :layout => false}
    end
  end

  def unlock
    @resource  = self.controller_model_type.camelize.constantize.find(params[:id])
    @resource.record_timestamps = false
    @resource.update_attribute(:lock, false)
    @resource.record_timestamps = true
    respond_to do |format|
      format.js { render "check/unlock", :layout => false}
    end
  end
end