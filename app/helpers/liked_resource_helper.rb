module LikedResourceHelper
  def show_like_button(resource)
    return unless current_user
    if LikedResource.check_model_is_liked(current_user, resource)
      unlike_button(resource)
    else 
      like_button(resource)
    end
  end

  def like_button(resource)
    link_to(like_path(:resource_id => resource.id, :resource_type => resource.class), :id => "like_button#{resource.id}", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-ok") + itext("like")
    end
  end

  def unlike_button(resource)
    link_to(unlike_path(:resource_id => resource.id, :resource_type => resource.class), :id => "unlike_button#{resource.id}", :class => " btn btn-mini" , "data-remote" => true, :method => :delete) do
      content_tag(:i, "", :class => "icon-remove") + itext("unlike")
    end
  end
end
