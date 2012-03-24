module NavigationHelper
  def navigation_for_device
    contents_tag :a, :class => "btn btn-navbar", "data-toggle" => "collapse", "data-target" => ".nav-collapse" do |contents|
      contents << content_tag(:span, '', :class => "icon-bar")
      contents << content_tag(:span, '', :class => "icon-bar")
      contents << content_tag(:span, '', :class => "icon-bar")
    end
  end
  
  def notifications
    notification_class = ["notifications"]
    notification_class << "unread" if unread_count > 0
    notification_class << "active" if ["notices"].index(params[:action])

    content_tag :li, :class => notification_class do
      link_to content_tag(:span, unread_count, :class => :count), user_notices_path(current_user)
    end
  end

  def modules_navigation
    render_list :class => 'nav' do |li|
      li << content_tag(:a, itext("navigation.community"),  :href => "")
      li << content_tag(:a, itext("navigation.wiki"),       :href => wiki_path)
      li << content_tag(:a, itext("navigation.vote"),       :href => "")
      li << content_tag(:a, itext("navigation.users"),      :href => users_path)
    end
  end
end