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

	def gravatar(email, size = nil)
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		base_url = "http://www.gravatar.com/avatar/#{gravatar_id}"
		if size
			base_url + "?r=G&s=#{size}"
		else
			base_url
		end
	end

	def user_avatar(user, size = nil)
		tag(:img, :alt => user.nickname, :src => gravatar(user.email, size))
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
		MarkDown.format(h(text)).html_safe
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

	def time_ago(time, options = {})
		options[:class] ||= "timeago"
		content_tag(:abbr, "", options.merge(:title => time.iso8601)).html_safe if time
	end

	def form_error_messages(resource)
		return "" if resource.errors.empty?
		messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg, :class => "") }.join
		sentence = itext("form_error",
		:count => resource.errors.count,
		:resource => resource.class.model_name.human.downcase)

		html = <<-HTML
		<div class="alert fade in alert-error">
			<h3>#{sentence}</h3>
			<ul>#{messages}</ul>
		</div>
		HTML

		html.html_safe
	end
end

module BootstrapHelper
	module Breadcrumb
		module InstanceMethods
			protected
			def set_breadcrumbs
				# @breadcrumbs = [(content_tag(:a, content_tag(:i, '', :class => "icon-home") + "Home", :href => "/")).html_safe]
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
