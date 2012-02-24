class Entry < ActiveRecord::Base
  validates :name, :presence => {:message => "can't be empty"}
end
