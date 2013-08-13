class PrintItem < ActiveRecord::Base
  # attr_accessible :name, :number, :tag_category
  belongs_to :print

  has_many :files, :class_name => 'PrintFile', :dependent => :destroy
  # accepts_nested_attributes_for :print_files, :allow_destroy => true
end