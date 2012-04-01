module UserHelper
  def show_user_tag(user)
    content_tag(:li, :class => "span3") do
      contents_tag(:a, :href => user_path(user)) do |contents|
        contents << show_user_portrait(user,:link => false)
        contents << content_tag(:strong, show_user_number(user))
        contents << content_tag(:em, user.nickname)
        contents << user.email
      end
    end
  end

  def unread_count
    current_user.notices.find(:all, :conditions => ['read = ?', false]).size 
  end

  def user_link(user, options = {})
    link_to(user.nickname, user_path(user), options)
  end

  def show_user_portrait(user, options = {})
    options        ||= {}
    options[:size] ||= 48
    options[:link] = true if (options[:link] == nil)
    options[:popdetail] = false if (options[:popdetail] == nil)

    detail = {}

    if options[:popdetail]
      if(user.idiograph == nil)
        idiograph = itext("user.lazy")
      else
        idiograph = user.idiograph
      end

      if(user.campus == nil)
        campus = itext("user.unkownpalce")
      else
        campus = user.campus
      end

      detail[:rel] = 'userpopover'
      detail["data-content"] = idiograph
      detail[:class] = 'user_avatar'
      detail["data-original-title"] = "<i><span class='icon-map-marker'></span>#{campus}</i> #{user.nickname}"
    end

    if (options[:link] == false)
      image_tag(gravatar(user.email, options[:size]), detail)
    else
      link_to(image_tag(gravatar(user.email, options[:size])), user_path(user), detail)
    end
  end

  def render_user_level_tag(user)
    if(user.level == 3)
      content_tag(:span, itext("admin_user"), :class => "label label-warning role")
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
