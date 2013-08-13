class Tag < ActiveRecord::Base
  has_and_belongs_to_many :topics
  belongs_to :tag_category

  attr_accessible :name, :number, :tag_category

  # tag删除的时候，清除m-t-m表中的关连数据
  before_destroy do
    topics.clear
  end

  def self.find_or_create_by_name name
    tag = self.find_by_name name
    unless tag
      tag = self.create!({ :name => name, :number => name})
    end
    tag
  end

  def self.suggest_tags
    tag_name_array = self.all.map {|tag| tag.name}
    tag_name_array.to_s
  end

  # def to_param
    # self.number.to_s
  # end
end