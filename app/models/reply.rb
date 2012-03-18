class Reply < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  belongs_to :replier,  :class_name => "User", :foreign_key => "user_id"

  attr_accessible :content, :user_id
end