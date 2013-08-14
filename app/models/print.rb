class Print < ActiveRecord::Base

  class CompletedPrintCanNotDestroy < Exception
  end

  attr_accessible :print_house_id

  belongs_to :fonder, :class_name => "User"
  belongs_to :print_house

  has_many :items, :class_name => 'PrintItem', :dependent => :destroy

  after_create :generate_first_print_item
  before_destroy :check_is_completed

  def generate_first_print_item
    self.items.create!
  end

  def check_is_completed
    raise CompletedPrintCanNotDestroy if self.is_completed
  end

  def complete!
    self.is_completed = true
    self.completed_at = Time.now
    self.save!
  end
end