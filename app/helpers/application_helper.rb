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

	def itext(id, *args)
		I18n.t(id, *args)
	end
end
