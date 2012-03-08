module UserHelper
  def show_user(user)
    contents_tag(:div, :class => "span4") do |contents|
      contents << show_user_gravatar(user.email)
      contents << show_user_info(user)
    end
  end

  def show_user_gravatar(email)
    content_tag(:div, :class => "span1") do
      tag(:img, :alt => '', :src => gravatar(email), :class => "portrait_top_bar")
    end
  end

  def show_user_info(user)
    content_tag(:div) do
      contents_tag :table do |contents|
        contents << content_tag(:tr, content_tag(:td, user.nickname))
        contents << content_tag(:tr, content_tag(:td, user.email))
        contents << content_tag(:tr, content_tag(:td, user.email))
      end
    end
  end

  def show_active_users_info
    itext("user.active_users_info")
  end

  def show_new_users_info
    itext("user.new_users_info")
  end
end