module ButtonHelper
	def form_button(name, options = {})
		content_tag(:div, :class => "form_button") do
			tag(:input, :type => :submit, :value => name, :class => "form_save btn #{options[:class]}")
		end
	end
end
