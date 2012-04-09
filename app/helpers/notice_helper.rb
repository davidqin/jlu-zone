# coding: utf-8
module NoticeHelper

  def mark_one_read_button(notice)
    content_tag :div, :class => :notice_one_read do
      content_tag :a, :href => mark_one_notices_read_path(notice), :class => "label one_read_notice", "data-method" => "put", "data-remote" => "true" do
        itext("notice.mark_one_read")
      end
    end
  end

  def mark_one_unread_button(notice)
    content_tag :div, :class => :notice_one_unread do
      content_tag :a, :href => mark_one_notices_unread_path(notice), :class => "label one_unread_notice", "data-method" => "put", "data-remote" => "true" do
        itext("notice.mark_one_unread")
      end
    end
  end
  
  def unread_notice?(notice)
    if notice.read == false
      content_tag :span, :class => "new_notice label label-info" do
        "New"
      end
    end
  end

  def notice_title_info(notice)
    # reply_notice_title_info
    # system_notice_title_info
    send "#{notice.notice_resource.model_type}_notice_title_info", notice
  end

  def reply_notice_title_info(notice)
    reply = notice.notice_resource
    if reply.resource.fonder == notice.to_user
      reply_resource_title_info(notice)
    else
      ated_title_info(notice)
    end    
  end

  def ated_title_info(notice)
    reply           = notice.notice_resource
    topic           = reply.resource
    reply_floor_url = topic_path(topic) + "#reply#{reply.floor_num}"
    notice_from_user(notice) + " 在 " + link_to(topic.name, reply_floor_url) + " 中提及你："
  end

  def reply_resource_title_info(notice)
    reply = notice.notice_resource
    topic = reply.resource
    reply_floor_url = topic_path(topic) + "#reply#{reply.floor_num}"
    notice_from_user(notice) + " 回复了你的话题 " + link_to(topic.name, reply_floor_url)
  end

  def notice_content(notice)
    markdown(notice.notice_resource.content)
  end

  def notice_from_user(notice)
    content_tag(:span, user_link(notice.from_user), :class => :from_name)
  end
end