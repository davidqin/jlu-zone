module Wiki::Models::IdNumberExchange::EntryCategoryNumberIdExchange
  
  def self.included(base)
    base.before_save :change_category_nubmer_to_id
    base.after_find :change_category_id_to_nubmer
  end

  attr_accessor :category_number

  def change_category_id_to_nubmer
    self.category_number = self.category.number
  end

  def change_category_nubmer_to_id
    category = EntryCategory.find_by_number(self.category_number)
    self.category_id = category.id
  end
end
