class Print < ActiveRecord::Base
  attr_accessible :print_house_id

  belongs_to :fonder, :class_name => "User"
  belongs_to :print_house

  has_many :items, :class_name => 'PrintItem'

  after_create :generate_first_print_item

  def generate_first_print_item
    self.items.create!
  end
end