module UserHelper
  def show_user_tag(user)
    content_tag(:li, :class => "span3") do
      contents_tag(:a, :href => user_path(user)) do |contents|
        contents << show_user_portrait
        contents << content_tag(:strong, show_user_number(user))
        contents << content_tag(:em, user.nickname)
        contents << user.email
      end
    end
  end

  def unread_count
    current_user.notices.find(:all, :conditions => ['read = ?', false]).size 
  end

  def from_user(notice)
    content_tag :a, :href => user_path(notice.from_user) do
      notice.from_user.nickname
    end
  end

  def show_user_portrait(user)
    tag(:img, :alt => '', :src => gravatar(user.email))
  end

  def show_user_number(user)
    user.id
  end

  def show_active_users_info
    itext("user.active_users_info")
  end

  def show_new_users_info
    itext("user.new_users_info")
  end

  def need_login_in_field
    (itext("reply.need_login_in") + link_to(itext("login"), new_user_session_path)).html_safe
  end

  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end