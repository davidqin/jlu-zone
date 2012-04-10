# coding: utf-8
module TopicHelper
	def show_topic_info(topic)
    # 节点那需要重构
    base_info       = time_ago(topic.created_at) + " 由 " + topic.fonder.nickname + " 在节点 " + topic.tag_string + " 中发起, " 
    reply_info      = ""
    reply_info      = " 最后由 " + topic.last_replier.nickname + " 于 " + time_ago(topic.last_reply.created_at).to_s + "回复, "  if topic.last_reply
    read_times_info = topic.read_times.to_s + "次阅读"
    base_info + reply_info + read_times_info
  end

  def show_topic_leader(topic)
  	base_info = " 由 " + user_link(topic.fonder) + " 在 " + time_ago(topic.created_at) + " 发起， "
    if (topic.last_reply != nil)
      reply_info = " 最后由 " + user_link(topic.last_replier) + " 于 " + time_ago(topic.last_reply.created_at).to_s + " 回复 "
    else
      reply_info = itext("topic.no_one_reply")
    end
    (base_info + reply_info).html_safe
  end

  def topic_tags_link(topic)
    contents_tag :div, :class => :tags do |content|
      content << itext("topic.tags")
      topic.tags.each do |tag|
        content << content_tag(:a, :href => tag_path(tag)) do
          tag.name
        end
      end
    end
  end

  def topic_replies_info(topic)
    return unless topic.replies.count != 0
    if topic.change_after_user_last_read? (current_user)
      content_tag :a, :href => "#", :class => "badge badge-info dynamic", :rel => "tooltip", "data-original-title" => itext("topic.new_reply") do
        "#{topic.replies.count}"
      end
    else
      content_tag :a, :href => "#", :class => "badge static", :rel => "tooltip", "data-original-title" => itext("topic.none_new_reply") do
        "#{topic.replies.count}"
      end
    end
  end

  def show_topic_title_link(topic)
  	content_tag :a, :href => topic_path(topic), :title => topic.name do
  		topic.name
  	end
  end

  def show_topic_tools_bar(topic)
    return unless current_user
    html_contents do |contents|
      contents << show_buttons_for_manager(topic)
      contents << show_follow_button(topic)
      contents << link_to("", :id => "reply_button", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
        content_tag(:i, "", :class => "icon-pencil") + itext("topic.make_reply")
      end
    end
  end

  def hot_topics
    hot_topics = Topic.order("replies_num desc").limit(10)
    contents_tag(:ul) do |contents|
      hot_topics.each do |topic|
        next if resource_lock?(topic)
        contents << link_to(content_tag(:li, topic.name), topic)
      end
    end
  end

  def top_topics
    top_topics = Topic.order("created_at desc").find_all_by_move_to_top(true)
    contents_tag(:ul) do |contents|
      top_topics.each do |topic|
        next if resource_lock?(topic)
        contents << link_to(content_tag(:li, topic.name), topic)
      end
    end
  end

end
