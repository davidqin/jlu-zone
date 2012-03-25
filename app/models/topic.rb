class Topic < ActiveRecord::Base
  belongs_to :fonder,      :class_name => "User"
  has_many   :replies,     :as => :resource
  has_and_belongs_to_many :tags

  def tag_string=(string)
    tags_names = string.to_s.downcase.split(/[,\s]+/).uniq
    self.tags = tags_names.map {|name| Tag.find_by_name(name)}
  end

  def tag_string
    names = self.tags.map {|tag| tag.name}
    names.join(', ')
  end
end