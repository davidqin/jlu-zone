class PrintHouse < ActiveRecord::Base
  attr_accessible :name, :phone, :description, :ip

  has_many :prints

  def to_s
    self.name
  end
end