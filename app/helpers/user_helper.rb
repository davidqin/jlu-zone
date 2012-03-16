module UserHelper
  def show_user_tag(user)
    content_tag(:li, :class => "span3") do
      contents_tag(:a, :href => user_path(user)) do |contents|
        contents << tag(:img, :alt => '', :src => gravatar(user.email))
        contents << content_tag(:strong, show_user_post_num)
        contents << content_tag(:em, user.nickname)
        contents << user.email
      end
    end
  end

  def show_user_post_num
    1
  end

  def show_active_users_info
    itext("user.active_users_info")
  end

  def show_new_users_info
    itext("user.new_users_info")
  end
end