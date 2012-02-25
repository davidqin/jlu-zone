module Wiki::Builders::ShowColumns
  #   item.show_string_column         :fonder
  def show_string_column(*methods)
    self.show_method_column(methods) do |value|
      self.safe_html_string(value)
    end
  end

  def show_method_column(methods, &block)
    self.show_column(methods) do |model|
      self.content_tag(:td, :class => find_option_form_methods(methods, :class)) do
        method_value = self.call_object_methods(model, methods)
        if block
          content = block.call(method_value)
        else
          content = method_value
        end
        content.to_s
      end
    end
  end

  def find_option_form_methods(methods, key)
    last_item = methods.last
    if last_item.is_a? Hash
      return last_item[key]
    else
      return nil
    end          
  end

  def call_object_methods(object, methods)    
    unless object
      return
    end

    methods = Array.wrap(methods)
    if methods.count == 0
      return
    end

    first_method = methods.first
    unless first_method
      return
    end

    unless object.respond_to?(first_method)
      return
    end

    method_result = object.send(first_method)
    if methods.count <= 1
      return method_result
    else
      remaining_methods = methods.clone
      remaining_methods.shift
      return call_object_methods(method_result, remaining_methods)
    end
  end

  def show_column(methods = nil, build_header_column_method = nil, &build_body_column_method)
    column = Wiki::Builders::ListBuilder::Column.new
    column.methods = methods
    column.build_header_column_method = build_header_column_method
    column.build_body_column_method   = build_body_column_method
    self.columns << column
  end

  def filter_method_option(methods)
    if methods.last.is_a? Hash
      methods[0..-2]
    else
      methods
    end
  end

  def safe_html_string(text)
    if text.is_a?(String)
      text.gsub(/\n/, "<br/>").html_safe
    else
      text.to_s
    end
  end
end
