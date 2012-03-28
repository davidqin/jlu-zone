class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname, :level

  has_many :entries, :foreign_key => 'fonder_id'
  has_many :topics,  :foreign_key => 'fonder_id'
  has_many :replies, :foreign_key => 'user_id'
  has_many :notices, :foreign_key => 'to_user_id', :class_name => "UserNotice"
  has_many :topic_read_histories

  def to_param
    self.nickname.to_s
  end
end