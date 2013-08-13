# coding: utf-8
class Reply < ActiveRecord::Base
  include Wiki::Models::Scores::LimitPerDay
  has_many :notices_to_users, :as => :notice_resource, :class_name => "UserNotice"
  belongs_to :subject, :polymorphic => true
  belongs_to :fonder, :class_name  => "User"


  before_create :set_floor_number_and_update_entry #need to refactor
  after_create  :give_the_ated_users_messages
  after_create  :give_the_topic_fonder_message

  attr_accessible :content, :user_id

  validates_presence_of :content, :message => "内容不能空着～"


  def self.create_score
    5
  end

  def self.score_times
    10
  end

  private

  def set_floor_number_and_update_entry
    subject        = self.subject
    new_replies_num = subject.replies_num + 1
    self.floor_num  = new_replies_num
    subject.update_attribute(:replies_num, new_replies_num)
  end

  def give_the_ated_users_messages
    users_names_array = []
    users_names_array = MarkDown.find_association_users(self.content)
    users = []
    users_names_array.each do |name|
      user = User.find_by_nickname(name)
      users << user if user
    end
    users.each do |user|
      next if user == self.subject.fonder
      notice = self.notices_to_users.new
      notice.to_user   = user
      notice.from_user = self.fonder
      notice.save
    end
  end

  def give_the_topic_fonder_message
    return unless self.subject.is_a? Topic
    topic = self.subject
    return if topic.fonder == self.fonder
    notice           = self.notices_to_users.new
    notice.to_user   = self.subject.fonder
    notice.from_user = self.fonder
    notice.save
  end
end
