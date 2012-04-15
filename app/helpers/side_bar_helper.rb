# coding: utf-8
module SideBarHelper
  def render_controller_sidebar
    path = self.controller_sidebar_path
    render path
  rescue ActionView::MissingTemplate
  end

  def render_info_statistics
    header = content_tag(:h4, itext("info_statistics"))
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

  def side_bar_items_list(items, title)
    return unless items
    return unless items.size != 0
    contents_tag :div, :class => :box do |c|
      c << content_tag(:h4, title)
      c << contents_tag(:ul) do |ul|
        items.each do |item|
          next if resource_lock?(item)
          ul << content_tag(:li, link_to(item.name, item))
        end
      end
    end
  end
end