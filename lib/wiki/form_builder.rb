class Wiki::FormBuilder < ActionView::Helpers::FormBuilder
	include Wiki::TemplateMethods
	include Wiki::FormBuilder::CommonFields

	def field_label(method, text_id = nil)
		self.method_label(method, text_id, :class => :field_name)
	end

	def method_label(method, text_id = nil, option = {})
		option[:class] = "control-label"
		text_id ||= method
		text = self.current_text(text_id)
		self.label(method, text, option)
	end

	def current_text_group=(text_group)
		@current_text_group = text_group
	end

	def current_text_group
		if @current_text_group
			@current_text_group 
		else
			@template.current_model_type
		end   
	end

	def current_text(text_id, *args)
		id = "#{self.current_text_group}.#{text_id}"
		itext(id, *args)
	end
end