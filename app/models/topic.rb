class Topic < ActiveRecord::Base
  belongs_to :fonder,      :class_name => "User"
  has_many   :replies,     :as => :resource
  has_many   :topic_read_histories, :class_name => "TopicReadHistory"
  has_and_belongs_to_many :tags
  
  validates_presence_of   :name, :message => "can't be empty"
  validates_uniqueness_of :name, :message => "can't be unique" 

  validates_presence_of   :content, :message => "can't be empty"
  
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

  def change_read_history(user)
    unless user
      add_one_read_times
      return
    end

    read_history = find_current_user_read_history(user)
    
    if read_history
      read_history.update_attribute(:last_read_at, Time.now)
    else
      read_history       = user.topic_read_histories.new
      read_history.topic = self
      read_history.save
      add_one_read_times
    end    
  end

  def changes_after_user_last_read(user)
    unless self.last_reply
      return 0
    end

    user_read_history = find_current_user_read_history(user)
    if user_read_history
      return self.replies.find(:all, :conditions => ["created_at >= ?", user_read_history.last_read_at]).count
    end

    if !user_read_history
      return self.replies.count
    end
        
  end

  private

  def find_current_user_read_history(user)
    read_history = user.topic_read_histories.find_by_topic_id(self.id)
    return read_history if read_history
    return false
  end


  def add_one_read_times
    self.read_times += 1
    self.record_timestamps = false
    self.save
    self.record_timestamps = true
  end

end