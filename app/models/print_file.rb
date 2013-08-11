class PrintFile < ActiveRecord::Base
  attr_accessible :file
  belongs_to :print_item
end