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
  
  def new_notice?(notice)
    if notice.read == false
      content_tag :span, :class => "new_notice label label-info" do
        "New"
      end
    end
  end
end