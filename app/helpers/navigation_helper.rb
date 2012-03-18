module NavigationHelper
  def user_functional_bar
    contents_tag :ul, :class => "nav pull-right" do |contents|
      contents << content_tag(:li, '', :class => "divider-vertical")
      if current_user
        contents << content_tag(:li, :id => :account_tab_button, :class => :dropdown) do
          html_contents do |items|
            items << contents_tag(:a) do |content| 
              content << itext("welcome", :name => current_user.nickname)
              content << tag(:img, :alt => '', :src => gravatar(current_user.email), :id => "portrait_top_bar")
            end
            items << account_tab
          end
        end
      else
        contents << content_tag(:li, content_tag(:a, itext("register"), :href => new_user_registration_path))
        contents << content_tag(:li, content_tag(:a, itext("login"), :id => :login_top_button, :login_url => login_dialog_path))
      end
    end    
  end

  def account_tab
    content_tag :div, :id => :account_tab, :class => "dropdown-menu" do
      contents_tag :div, :class => "row-fluid show-grid" do |contents|
        contents << content_tag(:div, :class => :span4) do
          tag(:img, :alt => '', :src => gravatar(current_user.email), :id => "popup_tab_portrait")
        end
        contents << content_tag(:div, :class => :span4) do
          contents_tag(:ul, :class => :unstyled) do |lis|
            lis << content_tag(:li, content_tag(:span, current_user.nickname))
            lis << content_tag(:li, content_tag(:span, current_user.email))
            lis << content_tag(:li, content_tag(:a, itext("edit_profile"), :href => edit_user_registration_path))
            if current_user.level == 3
              lis << content_tag(:li, content_tag(:a, itext("admin_panel"), :href => rails_admin_path))
            end
            lis << content_tag(:li, content_tag(:a, itext("logout"), :href => destroy_user_session_path, "data-method" => :delete))       
          end
        end
      end
    end
  end

  def navigation_for_device
    contents_tag :a, :class => "btn btn-navbar", "data-toggle" => "collapse", "data-target" => ".nav-collapse" do |contents|
      contents << content_tag(:span, '', :class => "icon-bar")
      contents << content_tag(:span, '', :class => "icon-bar")
      contents << content_tag(:span, '', :class => "icon-bar")
    end
  end

  def modules_navigation
    contents_tag :ul, :class => 'nav' do |contents|
      contents << content_tag(:li, content_tag(:a, itext("navigation.wiki"), :href => wiki_path))
      contents << content_tag(:li, content_tag(:a, itext("navigation.users"), :href => users_path))
    end
  end
end