class Category < ActiveRecord::Base
  acts_as_tree
  has_many :entries

  def to_param
    self.number.to_s
  end
  
end
