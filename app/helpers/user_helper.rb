module UserHelper
  def show_user_tag(user)
    content_tag(:li, :class => "span3") do
      contents_tag(:a, :href => user_path(user)) do |contents|
        contents << tag(:img, :alt => '', :src => gravatar(user.email))
        contents << content_tag(:strong, show_user_number(user))
        contents << content_tag(:em, user.nickname)
        contents << user.email
      end
    end
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
    content_tag :div, :class => "span12" do
      (itext("reply.need_login_in") + link_to(itext("login"), new_user_session_path)).html_safe
    end
  end

  def no_replies
    content_tag :div, :class => "span12" do
      itext("reply.no_replies")
    end
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