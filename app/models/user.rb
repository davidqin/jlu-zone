class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname, :level, :number

  has_many :entries, :foreign_key => 'fonder_id'
  has_many :photos
  has_many :topics,  :foreign_key => 'fonder_id'
  has_many :replies, :foreign_key => 'user_id'
  has_many :notices, :foreign_key => 'to_user_id', :class_name => "UserNotice"
  has_many :topic_read_histories
  has_many :followed_resources
  has_many :followed_topics, :class_name => 'Topic', :through => :followed_resources, :source => :resource, :source_type => :Topic  
  has_many :followed_photos, :class_name => 'Photo', :through => :followed_resources, :source => :resource, :source_type => :Photo  

  def to_param
    self.number.to_s
  end
end