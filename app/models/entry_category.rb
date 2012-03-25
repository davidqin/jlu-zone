class EntryCategory < ActiveRecord::Base
  has_many :entries, :foreign_key => "category_id"
  
  CATEGORY_NAMES = EntryCategory.all.collect do |category|
    [category.name, category.number]
  end
  
  def to_param
    self.number.to_s
  end
  
end
