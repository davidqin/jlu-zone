require "digest/md5"

module ApplicationHelper
	def render_main
		if self.controller.use_sidebar?
			render "layouts/body_main_layouts/with_side_bar"
		else
			render "layouts/body_main_layouts/without_side_bar"
		end
	end

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
	
	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
		:autolink => true, 
		:space_after_headers => true, 
		:fenced_code_blocks => true,
		:no_intra_emphasis => true,	
		:hard_wrap => true,	
		:strikethrough =>true)
		markdown.render(h(text)).html_safe
	end

	def share_button
		contents_tag(:div, :id => :ckepop) do |contents|
			contents << content_tag(:span, itext("share_to"), :class => :jiathis_txt)
			contents << content_tag(:a, '', :class => :jiathis_button_qzone)
			contents << content_tag(:a, '', :class => :jiathis_button_tsina)
			contents << content_tag(:a, '', :class => :jiathis_button_tqq)
			contents << content_tag(:a, '', :class => :jiathis_button_renren)
			contents << content_tag(:a, '', :class => :jiathis_button_fb)
			contents << content_tag(:a, '', :class => :jiathis_button_twitter)
			contents << content_tag(:a, '', :class => "jiathis jiathis_txt jiathis_separator jtico jtico_jiathis", :href => "http://www.jiathis.com/share?uid=1562818", :target =>"_blank")
			contents << content_tag(:a, '', :class => :jiathis_counter_style)
		end
	end

	def time_ago(time)
		itext("time_ago", :time => time_ago_in_words(time))
	end
end

module BootstrapHelper
	module Breadcrumb
		module InstanceMethods
			protected
			def set_breadcrumbs
				@breadcrumbs = [(content_tag(:a, content_tag(:i, '', :class => "icon-home") + "Home", :href => "/")).html_safe]
			end
		end
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
