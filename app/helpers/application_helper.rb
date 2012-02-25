module ApplicationHelper
  def html_text
    contents = []
    yield contents
    contents.join(' ').html_safe
  end
  
  def contents_tag(tag_name, options = {}, &block)
    self.content_tag tag_name, options do
      self.html_text(&block)
    end
  end
end
