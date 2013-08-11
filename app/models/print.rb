class Print < ActiveRecord::Base
  attr_accessible :print_house_id

  belongs_to :fonder, :class_name => "User"
  belongs_to :print_house

  has_many :print_items
  accepts_nested_attributes_for :print_items, :allow_destroy => true

  before_save :generate_first_print_item

  def generate_first_print_item
    self.print_items.build
  end
end