# coding: utf-8
module SideBarHelper
  def render_controller_sidebar
    path = self.controller_sidebar_path
    render path
  rescue ActionView::MissingTemplate
  end

  #网站信息统计
  def render_info_statistics
    header = content_tag(:div, itext("info_statistics"), :class => :side_bar_title)
    body = contents_tag :ul, :class => "nav nav-list" do |contents|
      contents << content_tag(:li, users_statistics)
      contents << content_tag(:li, topicss_statistics)
      contents << content_tag(:li, replies_statistics)
      contents << content_tag(:li, photos_statistics)
      contents << content_tag(:li, entries_statistics)
    end
    header + body
  end

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

  def replies_statistics
    itext("replies_statistics", :replies => Reply.all.size)
  end

  #items_list_helper
  def side_bar_items_list(items, title)
    return unless items
    return unless items.size != 0
    contents_tag :div, :class => :box do |c|
      c << content_tag(:div, title, :class => :side_bar_title)
      c << contents_tag(:ul) do |ul|
        items.each do |item|
          next if resource_lock?(item)
          ul << content_tag(:li, link_to(item.name, item))
        end
      end
    end
  end

  def hot_topics
    Topic.order("replies_num desc").limit(5)
  end

  def top_topics
    Topic.order("created_at desc").limit(10).find_all_by_move_to_top(true)
  end

  def no_reply_topics
    Topic.order("created_at desc").limit(5).find_all_by_replies_num(0)
  end

  #current_user

  def current_user_info_and_options
    if current_user
      render "/users/side_bar/current_user_info_and_options"
    else
      render "/users/side_bar/no_current_user"
    end
  end
end