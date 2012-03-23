class Reply < ActiveRecord::Base

  belongs_to :resource, :polymorphic => true
  belongs_to :replier,  :class_name => "User", :foreign_key => "user_id"

  has_many   :user_notices, :as => :notice_resource

  before_create :set_floor_number_and_update_entry#need to refactor
  after_create :give_the_users_messages
  
  attr_accessible :content, :user_id

  validates_presence_of :content, :message => "can't be empty"

  private

  def set_floor_number_and_update_entry
    resource        = self.resource
    new_replies_num = resource.replies_num + 1
    self.floor_num  = new_replies_num
    resource.update_attribute(:replies_num, new_replies_num)
  end

  def give_the_users_messages
    users_names_array = []
    users_names_array = MarkDown.find_association_users(self.content)
    users = []
    users_names_array.each do |name|
      users << User.find_by_nickname(name)
    end
    users.each do |user|
      notice = self.user_notices.new
      notice.to_user   = user
      notice.from_user = self.replier
      notice.save
    end
  end
end
