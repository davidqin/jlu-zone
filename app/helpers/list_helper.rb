module ListHelper
  # show_list @entries do |item|
  #   item.show_string_column         :fonder
  #   item.show_string_column         :name
  #   item.show_text_column           :content
  #   item.show_date_column           :create_at
  #   item.show_time_column           :x_field
  # end

  # ---------------------------------------------------------------
  # Demo:
  # show_list @sale do |list|
  #   list.show_text_link_column :number
  # end
  #
  # Explain:
  #   text = sale.number
  #   link = link_to(sale)
  # ---------------------------------------------------------------
  
  # ---------------------------------------------------------------
  # Demo:
  # show_model_list @sale do |list|
  #   list.show_text_link_column :member, :number
  # end
  #
  # Explain:
  #   text = sale.member.number
  #   link = link_to(sale.member)
  # ---------------------------------------------------------------
  
  def show_list(models, text_group = nil, &block)
    builder = Wiki::Builders::ListBuilder.new(self, text_group)
    builder.build_list(models, &block)
  end
end