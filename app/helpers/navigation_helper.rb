module NavigationHelper
  def navigation_for_device
    contents_tag :a, :class => "btn btn-navbar", "data-toggle" => "collapse", "data-target" => ".nav-collapse" do |contents|
      contents << content_tag(:span, '', :class => "icon-bar")
      contents << content_tag(:span, '', :class => "icon-bar")
      contents << content_tag(:span, '', :class => "icon-bar")
    end
  end

  def modules_navigation
    contents_tag :ul, :class => 'nav' do |contents|
      contents << content_tag(:li, content_tag(:a, itext("navigation.wiki"), :href => wiki_path))
      contents << content_tag(:li, content_tag(:a, itext("navigation.users"), :href => users_path))
    end
  end
end