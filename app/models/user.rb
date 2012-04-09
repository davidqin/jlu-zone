class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname, :level, :number

  #before_save :full_info_score

  has_many :entries, :foreign_key => 'fonder_id'
  has_many :albums
  has_many :topics,  :foreign_key => 'fonder_id'
  has_many :replies, :foreign_key => 'user_id'
  has_many :notices, :foreign_key => 'to_user_id', :class_name => "UserNotice"
  has_many :topic_read_histories
  has_many :followed_resources
  has_many :followed_topics, :class_name => 'Topic', :through => :followed_resources, :source => :resource, :source_type => :Topic  
  has_many :followed_albums, :class_name => 'Album', :through => :followed_resources, :source => :resource, :source_type => :Album

  def to_param
    self.number.to_s
  end

  def self.full_info_score
    50
  end
  
  def full_info_score
    binding.pry
    if self.full_info == false and self.full_info?
      self.score += User.full_info_score
      self.full_info = true
    end
  end

  def full_info?
    attribute_array = %w(nickname email level number)
    attribute_array.each do |attribute|
      return false if self.send(attribute).blank?
    end
    return true
  end
end