module SideBarHelper
  def render_controller_sidebar
    path = self.controller_sidebar_path
    render path
  rescue ActionView::MissingTemplate
  end

  def render_info_statistics
    header = content_tag(:header, itext("info_statistics"))
    body = contents_tag :ul, :class => "nav nav-list" do |contents|
      contents << content_tag(:li, users_statistics)
      contents << content_tag(:li, entries_statistics)
      contents << content_tag(:li, topicss_statistics)
      contents << content_tag(:li, photos_statistics)
    end
    header + body
  end

  private

  def users_statistics
    itext("users_statistics", :users => User.all.size)
  end

  def entries_statistics
    itext("entries_statistics", :entries => Entry.all.size)
  end

  def topicss_statistics
    itext("topics_statistics", :topics => Topic.all.size)
  end

  def photos_statistics
    itext("photos_statistics", :photos => Photo.all.size)
  end
end