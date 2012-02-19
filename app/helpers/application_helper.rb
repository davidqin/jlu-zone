module ApplicationHelper
	def footer
		html_contents do |contents|
			contents << contents_tag(:p) do |content|
				content << "Powered by "
				content << content_tag(:a, itext("logo"), :href => "www.jluwiki.com")
			end
			contents << contents_tag(:p) do |items|
				items << "Designed and Development By "
				items << content_tag(:a, "1", :href => "a")
				items << content_tag(:a, "2", :href => "b")
				items << content_tag(:a, "3", :href => "c")
				items << content_tag(:a, "4", :href => "d")
			end
			contents << contents_tag(:p) do |item|
				item << itext("copyright_front")
				item << content_tag(:a, itext("copyright_link"), :href => "http://creativecommons.org/licenses/by/3.0/")
				item << itext("copyright_behind")
			end
			contents << footer_function
		end
	end
	
	def footer_function
	end

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

	def content_header(text)
		content_tag(:header, :class => "page-header") do
			content_tag(:h1, text)
		end
	end

	def error_messages_for(model)
		if model.errors.empty?
			error_messages_for_with_object_no_error
		else
			error_messages_for_with_object_has_error(model)
		end
	end

	def error_messages_for_with_object_no_error
		return unless flash[:error]
		content_tag(:div, :id => "errorExplanation", :class => "alert alert-error") do
			content_tag(:h2, flash[:error] )
		end
	end

	def error_messages_for_with_object_has_error(model)
		contents_tag(:div, :id => "errorExplanation", :class => "alert alert-error") do |contents|
			contents << content_tag(:a, "x", :class => "close", "data-dismiss" => "alert")

			contents << content_tag(:h4, :class => "alert-heading") do
				if flash[:error]
					t(:error_title1, :error => flash[:error], :count => model.errors.count)
				else
					t(:error_title2, :count => model.errors.count)
				end
			end

			contents << contents_tag(:ul) do |error_list|
				model.errors.each do  |key, msg|
					error_list << content_tag(:li, msg)
				end
			end
		end
	end

	def login_notice
		return unless flash[:login]
		contents_tag :div, :class => "alert alert-error smartnotice" do |contents|
			contents << content_tag(:a, "x", :class => "close", :href => "#", "data-dismiss" => "alert")
			contents << content_tag(:p, flash[:login])
		end
	end

	def content_notice
		return unless flash[:notice]
		contents_tag :div, :class => "alert alert-success smartnotice" do |contents|
			contents << content_tag(:a, "x", :class => "close", :href => "#", "data-dismiss" => "alert")
			contents << content_tag(:p, flash[:notice])
		end
	end

	def current_model_type
		self.controller_name.singularize.to_s
	end

	def wiki_logo
		content_tag :a, :href => "/", :class => :brand do
			itext('logo')
		end
	end
	
	ActionView::Base.default_form_builder = Wiki::FormBuilder
end
