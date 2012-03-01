require "digest/md5"

module ApplicationHelper
	def wiki_logo
		content_tag(:a, itext('logo'), :href => "/", :class => :brand)
	end

	def gravatar(email)   
		gravatar_id = Digest::MD5.hexdigest(email.downcase)   
		"http://www.gravatar.com/avatar/#{gravatar_id}" 
	end

	def back_to_top
		content_tag :p, :id => "back-to-top" do
			contents_tag :a, :href => "#top" do |contents|
				contents << content_tag(:span)
				contents << itext("back_to_top")
			end
		end
	end

	def user_navigation
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
				contents << content_tag(:li, content_tag(:a, itext("login"), :login_url => login_dialog_path, :id => :login_top_button))
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

	def markdown(text)
    options = {   
        :autolink => true, 
        :space_after_headers => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :hard_wrap => true,
        :strikethrough =>true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,options)
    markdown.render(h(text)).html_safe
  end

  def show_base_categories
  	return unless @base_categories
  	contents_tag :ul, :class => "pull-right" do |contents|
  		@base_categories.each do |base_category|
  			contents << content_tag(:li, base_category.name.to_s)
  		end
  	end   
  end

  def show_catelogs
  	"wiki"
  end

end


class ActionView::Base
	def html_contents
		contents = []
		yield contents
		contents.join(' ').html_safe
	end

	def contents_tag(tag_name, options = {}, &block)
		self.content_tag tag_name, options do
			self.html_contents(&block)
		end
	end
end
