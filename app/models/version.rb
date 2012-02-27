class Version < ActiveRecord::Base
  
  belongs_to :entry
  belongs_to :editor, :class_name => "User"
end
