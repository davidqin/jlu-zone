module FollowedResourceHelper
  def show_follow_button(resource)
    return unless current_user
    if FollowedResource.check_model_is_followed(current_user, resource)
      unfollow_button(resource) + follow_button(resource, true)

    else
      unfollow_button(resource, true) + follow_button(resource)
    end
  end

  def follow_button(resource, hide = false)
    hide_class = hide ? " hide" : ""
    link_to(follow_path(:resource_id => resource.id, :resource_type => resource.class), :id => "follow_button", :class => " btn btn-mini#{hide_class}" , "data-remote" => true, :method => :post, :remote => true, 'data-type' => 'json') do
      content_tag(:i, "", :class => "icon-ok") + itext("follow")
    end
  end

  def unfollow_button(resource, hide = false)
    hide_class = hide ? " hide" : ""
    link_to(unfollow_path(:resource_id => resource.id, :resource_type => resource.class), :id => "unfollow_button", :class => " btn btn-mini#{hide_class}" , "data-remote" => true, :method => :delete, :remote => true, 'data-type' => 'json') do
      content_tag(:i, "", :class => "icon-remove") + itext("unfollow")
    end
  end
end
