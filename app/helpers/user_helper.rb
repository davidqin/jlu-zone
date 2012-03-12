module UserHelper
  def show_user(user)
    content_tag(:li) do
      contents_tag(:a, :href => user_path(user)) do |contents|
        contents << tag(:img, :alt => '', :src => gravatar(user.email))
        contents << content_tag(:strong, show_user_post_num)
        contents << content_tag(:em, user.nickname)
        contents << user.email
      end
    end
  end

  def show_user_gravatar(email)
    content_tag(:div, :class => "span1") do
      tag(:img, :alt => '', :src => gravatar(email), :class => "portrait_top_bar")
    end
  end

  def show_user_post_num
    1
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