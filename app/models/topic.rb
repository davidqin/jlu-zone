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

  def change_after_user_last_read?(user)
    unless user
      return true
    end

    user_read_history = find_current_user_read_history(user)

    if user_read_history
      new_replies_after_last_read?(user,user_read_history)
    else
      return true
    end        
  end

  def am_i_followed_by?(user)
    return false unless user
    history = self.topic_read_histories.find_by_user_id(user.id)
    return false unless history
    return history.followed
  end

  private

  def new_replies_after_last_read?(user,history)
    user_last_read_time = history.last_read_at
    user_last_reply     = self.replies.order("created_at desc").find_by_user_id(user.id)

    if user_last_reply
      user_last_reply_time = user_last_reply.created_at 
      last_time = [user_last_read_time, user_last_reply_time].max
    else
      last_time = user_last_read_time
    end

    count = self.replies.find(:all, :conditions => ["created_at > ?", last_time]).count
    return true if count > 0
    return false    
  end

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