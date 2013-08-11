class PrintHouse < ActiveRecord::Base
  attr_accessible :name, :phone, :description, :ip

  has_many :prints
end