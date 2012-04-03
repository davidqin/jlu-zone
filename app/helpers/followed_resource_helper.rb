module FollowedResourceHelper
  def show_follow_button(resource)
    if FollowedResource.check_model_is_followed(current_user, resource)
      unfollow_button(resource)
    else 
      follow_button(resource)
    end
  end

  def follow_button(resource)
    link_to(follow_path(:resource_id => resource.id, :resource_type => resource.class), :id => "follow_button#{resource.id}", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-ok") + itext("follow")
    end
  end

  def unfollow_button(resource)
    link_to(unfollow_path(:resource_id => resource.id, :resource_type => resource.class), :id => "unfollow_button#{resource.id}", :class => " btn btn-mini" , "data-remote" => true, :method => :delete) do
      content_tag(:i, "", :class => "icon-remove") + itext("unfollow")
    end
  end
end
