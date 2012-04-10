module ButtonsToManagerHelper
  def show_buttons_for_manager(resource)
    return if not current_user.admin

  end

  def lock_button
    link_path = "lock_" + resource.model_type.to_s + "_path"
    link_to( send(link_path, resource) , :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-ok") + itext("follow")
    end
  end

  def unlock_button
    
  end
end