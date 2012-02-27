module Wiki::Builders::ShowColumns

  def string_column(method)
    self.column_without_link(method)
  end

  def link_string_column(method, link = nil)
    self.column_with_link(method, link)
  end

  def text_column(method)
    self.column_without_link(method) do |value|
      self.safe_html_string(value)
    end
  end

  def column_without_link(method, &block)
    self.column(method) do |model|
      self.content_tag(:td, :class => "") do
        value   = model.send(method)
        content = value
        content = block.call(value)  if block
        content.to_s
      end
    end
  end

  def column_with_link(method, link, &block)
    self.column(method, link) do |model|
      self.content_tag(:td, :class => "") do
        value        = model.send(method)
        content_name = value
        content_name = block.call(value)  if block
        if link && model.respond_to?(link)
          content_link = model.send(link)
        else
          content_link = link || model
        end
        link_to content_name, content_link if content_link
      end
    end
  end

  def column(method = nil, link = nil, build_header_column_method = nil, &build_body_column_method)
    column = Wiki::Builders::ListBuilder::Column.new
    column.method = method
    column.build_header_column_method = build_header_column_method
    column.build_body_column_method   = build_body_column_method
    self.columns << column
  end

  def safe_html_string(text)
    if text.is_a?(String)
      text.gsub(/\n/, "<br/>").html_safe
    else
      text.to_s
    end
  end 
end