class EntryCategory < ActiveRecord::Base
  has_many :entries, :foreign_key => "category_id"

  def to_param
    self.number.to_s
  end
  
end
