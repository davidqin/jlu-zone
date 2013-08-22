# encoding: utf-8

class PrintItem < ActiveRecord::Base

  PAPER_SIZE = %w(A4 B5)

  attr_accessible :paper_size, :start_page, :end_page, :style, :single_page, :copies, :memo
  belongs_to :print

  has_many :files, :class_name => 'PrintFile', :dependent => :destroy
  # accepts_nested_attributes_for :print_files, :allow_destroy => true

  def format
    range = end_page == 0 ? "所有页" : "第#{self.start_page}页-第#{self.end_page}页"
    extra = self.memo.blank? ? "" : "额外要求：#{self.memo}"
    single_page = self.single_page ? "单面打印" : "反正面打印"
    "#{self.paper_size}纸张，打印#{range}，每页#{self.style}版，#{single_page}, 共打印#{self.copies}份。#{extra}"
  end
end