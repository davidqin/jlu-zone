class Wiki::Builders::ModelFormBuilder < ActionView::Helpers::FormBuilder
  include Wiki::Builders::TemplateMethods
  include Wiki::Builders::ShowText
  def show_text_input(method, options = {})
    options ||={}
    html_options = options[:html] || {}
    input_options = options[:input_options] || {}
    self.show_method_input(method, html_options) do
      self.text_field(method, input_options)
    end
  end

  def show_email_input(method)
    self.show_method_input(method) do
      self.contents_tag(:div, :class => "input-append") do |contents|          
        contents << self.email_field(method, :class => :medium)
        contents << self.content_tag(:span, content_tag(:i, '', :class =>"icon-envelope"), :class => "add-on")
      end
    end
  end

  def show_password_input(method)
    self.show_method_input(method) do
      self.password_field(method, :class => 'xlarge')
    end
  end

  def show_check_box_input(method, options = {})
    self.show_method_input(method) do
      contents_tag(:label, :class => :checkbox) do |contents|
        contents << self.check_box(method, options)
        contents << self.content_tag(:span, self.show_current_itext("#{method}_detail"))
      end
    end
  end

  def show_method_input(method, options = {})
    label_text = options[:label_text] || self.show_current_itext(method)
    div_options = options[:class] || ''

    if object.errors.count > 0 and object.errors[method].count > 0
      div_options = " error"
    end

    self.contents_tag :div, :class => "control-group #{div_options}" do |contents|          
      contents << self.label(method, label_text, :class => "control-label")
      contents << self.content_tag(:div, :class => 'controls') do
        yield
      end
    end
  end

  protected

  def show_current_itext_base
    self.object.class.to_s.underscore
  end
end