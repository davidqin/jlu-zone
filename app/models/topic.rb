class Topic < ActiveRecord::Base
  belongs_to :fonder,      :class_name => "User"
  has_many   :replies,     :as => :resource
  has_and_belongs_to_many :tags

  
  validates_presence_of   :name, :message => "can't be empty"
  validates_uniqueness_of :name, :message => "can't be unique" 

  validates_presence_of   :content, :message => "can't be empty"

  def one_read
    self.read_times += 1
    self.save
  end
  
  def tag_string=(string)
    tags_names = string.to_s.split(/[,\s]+/).uniq
    self.tags = tags_names.map {|name| Tag.find_by_name(name)}
  end

  def tag_string
    names = self.tags.map {|tag| tag.name}
    names.join(', ')
  end

  def last_reply
    self.replies.order(:created_at).last
  end

  def last_replier
    last_reply.replier
  end
end