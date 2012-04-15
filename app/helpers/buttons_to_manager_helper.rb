module ButtonsToManagerHelper
  def show_buttons_for_manager(resource)
    return if cannot? :lock, resource
    return if cannot? :unlock, resource
    if resource.lock
      unlock_button(resource)
    else
      lock_button(resource)
    end
  end

  def lock_button(resource)
    link_path = "lock_" + resource.model_type.to_s + "_path"
    link_to( send(link_path, resource) ,:id => "lock_button#{resource.id}", :class => " btn btn-mini btn-danger" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-remove") + itext("lock")
    end
  end

  def unlock_button(resource)
    link_path = "unlock_" + resource.model_type.to_s + "_path"
    link_to( send(link_path, resource) ,:id => "unlock_button#{resource.id}", :class => " btn btn-mini btn-success" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-ok") + itext("unlock")
    end
  end

  def resource_lock?(resource)
    return false if can?(:lock, resource)
    return false if can?(:unlock, resource)
    return resource.lock if resource.respond_to? :lock
    return false
  end
end