module ListHelper
  # show_list @entries do |item|
  #   item.link_string_column    :fonder
  #   item.string_column         :name
  #   item.text_column           :content
  # end

  def show_list(models, text_group = nil, &block)
    builder = Wiki::Builders::ListBuilder.new(self, text_group)
    builder.build_list(models, &block)
  end
end