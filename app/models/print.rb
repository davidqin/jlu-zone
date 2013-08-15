# coding: utf-8
class Print < ActiveRecord::Base

  class CompletedPrintCanNotDestroy < Exception
  end

  attr_accessible :print_house_id

  belongs_to :fonder, :class_name => "User"
  belongs_to :print_house

  has_many :items, :class_name => 'PrintItem', :dependent => :destroy

  before_create :check_uncompleted_print
  after_create :generate_first_print_item
  before_destroy :check_is_completed

  def check_uncompleted_print
    if self.fonder.uncompleted_print
      self.errors[:base] << "你有没完成的打印订单"
      return false
    end
  end

  def generate_first_print_item
    self.items.create!
  end

  def check_is_completed
    raise CompletedPrintCanNotDestroy if self.is_completed
  end

  def complete
    self.items.each do |item|
      item.destroy if item.files.blank?
    end

    if self.items(true).blank?
      self.errors[:base] << "没有任何可以打印的文件，无法完成打印订单"
      return false
    end

    self.is_completed = true
    self.completed_at = Time.now
    self.save
  end
end