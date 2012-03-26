class Tag < ActiveRecord::Base
  has_and_belongs_to_many :topic
  belongs_to :tag_category

  def self.suggest_tags
    tag_name_array = self.all.map {|tag| tag.name}
    tag_name_array.to_s
  end
end