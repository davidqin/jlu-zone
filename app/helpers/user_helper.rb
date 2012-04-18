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

  def render_user_honor
    "Xinshou"
  end

  def render_user_score_bar
    next_level_exp = 5000
    # percent = @user.score * 100 / next_level_exp
    # content_tag :div, :class => "progress progress-striped active exp" do
    #   content_tag :div, :class => :bar, :style => "width: #{percent}%" do
    #     "#{percent}%"
    #   end
    # end
    "#{@user.score} / #{next_level_exp}"
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
    if(user.admin_permission)
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

  def set_user_permission(user, permission)
    return if cannot? :manager, user
    if user.send(permission)
      cancel_user_permission_button(user, permission)
    else
      set_user_permission_button(user, permission)
    end
  end

  def cancel_user_permission_button(user, permission)
    link_to( cancel_user_permission_path(user, :permission => permission) ,:id => "cancel_user_permission_button#{user.number}#{permission}", :class => " btn btn-mini btn-success" , "data-remote" => true, :method => :delete) do
      content_tag(:i, "", :class => "icon-ok")
    end
  end

  def set_user_permission_button(user, permission)
    link_to( set_user_permission_path(user, :permission => permission) ,:id => "set_user_permission_button#{user.number}#{permission}", :class => " btn btn-mini btn-danger" , "data-remote" => true, :method => :post) do
      content_tag(:i, "", :class => "icon-remove")
    end
  end  
end
