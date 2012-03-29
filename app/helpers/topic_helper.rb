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
  	base_info = " 由 " + user_link(topic.fonder) + " 在 " + time_ago(topic.created_at) + " 发起 "
  	base_info.html_safe
  end

  def topic_last_reply(topic)
    if (topic.last_reply != nil)
      reply_info = " 最后由 " + user_link(topic.last_replier) + " 于 " + time_ago(topic.last_reply.created_at).to_s + " 回复 "
    else
      reply_info = itext("topic.no_one_reply")
    end
    reply_info.html_safe
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
    if topic.change_after_user_last_read? (current_user)
      content_tag :span, :class => "badge badge-info" do
        content_tag :a, :href => "#" do
          "#{topic.replies.count}"
        end
      end
    else
      content_tag :span, :class => "badge" do
        content_tag :a, :href => "#" do
          "#{topic.replies.count}"
        end
      end
    end
  end

  def show_topic_title_link(topic)
  	content_tag :a, :href => topic_path(topic), :title => topic.name do
  		topic.name
  	end
  end

  def show_topic_tools_bar(topic)
    html_contents do |contents|
      contents << follow_button(topic)
      #icon-remove
      contents << link_to(unfollow_topic_path(topic), :id => "reply_button", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
        content_tag(:i, "", :class => "icon-pencil") + itext("topic.make_reply")
      end
    end
  end

  def follow_button(topic)
    link_to(follow_topic_path(topic), :id => "follow_button", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-ok") + itext("topic.follow")
    end
  end

  def unfollow_button(topic)
    link_to(unfollow_topic_path(topic), :id => "unfollow_button", :class => " btn btn-mini" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-remove") + itext("topic.unfollow")
    end
  end
end
