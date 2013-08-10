class TagCategory < ActiveRecord::Base
  has_many :tags

  attr_accessible :name
end