module Wiki::FormBuilder::CommonFields
	def input_text_field(method, field_options = {}, div_options = {})
		div_options[:class] = "#{div_options[:class]} control-group"
		self.contents_tag :div, div_options do |contents|
			contents << self.method_label(method)
			contents << self.content_tag(:div, self.text_field(method, field_options), :class => :controls)
		end
	end

	def input_email_field(method)
		self.contents_tag :div , :class => "control-group" do |contents|
			contents << self.method_label(method)
			contents << self.content_tag(:div, :class => :controls) do
				self.contents_tag(:div, :class => "input-prepend") do |contents|
					contents << self.content_tag(:span, content_tag(:i, '', :class =>"icon-envelope"), :class => "add-on")
					contents << self.email_field(method, :class => :medium)
				end
			end
		end
	end

	def input_email_field_append(method)
		self.method_label(method)+self.content_tag(:div, :class => :controls) do
			self.contents_tag(:div, :class => "input-append") do |contents|          
				contents << self.email_field(method, :class => :medium)
				contents << self.content_tag(:span, content_tag(:i, '', :class =>"icon-envelope"), :class => "add-on")
			end
		end
	end

	def input_password_field(method)
		content_tag :div, :class => "control-group" do
			self.method_label(method)+self.content_tag(:div, self.password_field(method, :class => "input-large change"), :class => :controls)
		end
	end

	def input_password_field_login(method)
		content_tag :div, :class => "control-group" do
			self.method_label(method)+self.content_tag(:div, self.password_field(method, :class => "input-xlarge change") + (hyper_to current_text('forgot_password'), forgot_password_path, :id => :forgot_password), :class => :controls)
		end
	end

	def input_memo_field(method)
		self.contents_tag :div, :class => "control-group" do |contents|
			contents << self.method_label(method)
			contents << self.content_tag(:div, self.text_area(method, :rows => 3, :cols => 40), :class => :controls)
		end
	end

	def input_date_time_field(method, options = nil)
		options[:class] = "#{options[:class]} control-group"
		self.contents_tag :div, options do |contents|
			contents << self.method_label(method)
			contents << contents_tag(:div , :class => :controls) do |contents|
				contents << self.text_field(method, :class =>'date_time_input', :name => "")
				contents << self.time_select(method, {}, :class =>'time_select')
			end
		end
	end

	def input_select_field(method, include_blank = false, options = nil)
		method = method.to_s
		choices = @object.send("#{method}_names")
		input_select_by_number_field_core(method, choices, include_blank, options)
	end

	def input_select_by_number_field_core(method, choices, include_blank = false, html_options = nil)
		method_for_number = "#{method}_number"
		self.contents_tag :div , :class => "control-group" do |contents|
			contents << self.method_label(method_for_number, "#{method}.name")
			contents << self.content_tag(:div, :class => :controls) do
				self.select(method_for_number, choices, {:include_blank => include_blank}, html_options||{})
			end
		end
	end

	def input_select_field_with_button(method, include_blank = false, html_options = nil, button_options = nil)
		choices = @object.send("#{method}_names")
		method_number = "#{method}_number"
		self.contents_tag :div , :class => "control-group" do |contents|
			contents << self.method_label(method_number, "#{method}.name")
			contents << contents_tag(:div , :class => :controls) do |contents|
				contents << self.select(method_number, choices, {:include_blank => include_blank}, html_options||{})
				contents << @template.content_tag(:button, t('add'), button_options)
			end
		end
	end

	def input_check_box_field(method, options = {})
		self.contents_tag :div , :class => "control-group" do |contents|
			contents << self.method_label(method)
			contents << contents_tag(:div , :class => :controls) do |contents|
				contents << content_tag(:label, :class => :checkbox) do
					self.check_box(method, options) + 
					self.content_tag(:span, self.current_text("#{method}_detail"))
				end
			end
		end
	end

	def input_prepend_check_box_field(method,options = {})
		self.contents_tag :div, :class => "control-group" do |contents|
			contents << self.method_label(method)
			contents << content_tag(:div, :class => :controls) do
				self.content_tag(:div, :class => "input input-prepend") do
					first = content_tag(:label , :class => "add-on") do
						check_box(method, options)
					end
					first + self.text_field(:discount_percent ,:class => 'discount', :placeholder => t('product.discount_example'))
				end
			end
		end
	end

	def input_check_box_list_field(name, method_list, label_options = {})
		content_tag :div, :class => "control-group" do
			content_label = self.method_label(name)
			content_value = contents_tag :div, :class => :controls do |contents|
				method_list.each do |method|
					contents << self.input_check_box_list_field_item(method, label_options)
				end
			end
			content_label + content_value
		end

		def input_check_box_list_field_item(method, label_options = {})
			contents_tag(:label, label_options) do |contents|
				contents << self.check_box(method, options)
				contents << self.content_tag(:span, self.current_text("#{method}_detail")) #method_label(method, "#{method}_detail")
			end
		end

		def show_text_field(method)
			text = @object.send(method)
			self.contents_tag :div, :class => "control-group" do |contents|
				contents << self.method_label(method)
				contents << self.content_tag(:div, self.content_tag(:span, text, :class => "uneditable-input"), :class => :controls)
			end
		end
	end
end