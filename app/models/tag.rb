class Tag < ActiveRecord::Base
  has_and_belongs_to_many :topics

  def self.suggest_tags
    tag_name_array = self.all.map {|tag| tag.name}
    tag_name_array.to_s
  end
end