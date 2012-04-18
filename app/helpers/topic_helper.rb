# coding: utf-8
module TopicHelper
	def show_topic_info(topic)
    # 节点那需要重构
    base_info       = time_ago(topic.created_at) + " 由 " + topic.fonder.nickname + " 在节点 " + topic.tag_string + " 中发起, " 
    reply_info      = ""
    reply_info      = time_ago(topic.last_reply.created_at).html_safe.to_s + " 由 " + topic.last_replier.nickname + " 最后回复, "  if topic.last_reply
    read_times_info = topic.read_times.to_s + "次阅读"
    base_info + reply_info + read_times_info
  end

  def show_topic_leader(topic)
  	base_info = time_ago(topic.created_at) + " " + user_link(topic.fonder) + " 发起. "
    if (topic.last_reply != nil)
      reply_info = user_link(topic.last_replier) + " 最后回复于" + time_ago(topic.last_reply.created_at).to_s
    else
      reply_info = ""
    end
    content_tag :span, :class => :topic_leader do
      (base_info + reply_info).html_safe  
    end
  end

  def show_topic_tags(topic)
    contents_tag :span, :class => :tags do |content|
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
      contents << move_and_cancel_to_top_button(topic)
      contents << show_buttons_for_manager(topic)
      contents << show_like_button(topic)
      contents << show_follow_button(topic)
      contents << link_to("", :id => "reply_button", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
        content_tag(:i, "", :class => "icon-pencil") + itext("topic.make_reply")
      end
    end
  end

  def move_and_cancel_to_top_button(topic)
    return if cannot? :move_to_top, topic
    return if cannot? :unmove_to_top, topic
    if topic.move_to_top
      cancel_move_to_top_button(topic)
    else
      move_to_top_button(topic)
    end
  end

  def move_to_top_button(topic)
    link_to( move_to_top_topic_path(topic) ,:id => "move_to_top_button#{topic.id}", :class => " btn btn-mini btn-info" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-arrow-up") + itext("topic.move_to_top")
    end
  end

  def cancel_move_to_top_button(topic)
    link_to( cancel_move_to_top_topic_path(topic) ,:id => "cancel_move_to_top_button#{topic.id}", :class => " btn btn-mini btn-info" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-repeat") + itext("topic.cancel_move_to_top")
    end
  end
end
