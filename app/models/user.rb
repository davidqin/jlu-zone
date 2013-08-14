# coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessible :nickname, :campus, :password, :password_confirmation, :email, :remember_me, :avatar,
                  :a_x1, :a_x2, :a_y1, :a_y2

  attr_accessor :a_x1, :a_y1, :a_y2, :a_x2

  validates :nickname,
    :presence     => { :message => '昵称不能空着阿' },
    :length       => { :message => '名字长度2-10个字符', :in => 2..10}

  #before_save :full_info_score
  has_many :entries, :foreign_key => 'fonder_id'
  has_many :albums,  :foreign_key => 'fonder_id'
  has_many :photos,  :foreign_key => 'fonder_id'
  has_many :topics,  :foreign_key => 'fonder_id'
  has_many :replies, :foreign_key => 'fonder_id'
  has_many :prints,  :foreign_key => 'fonder_id'
  has_many :notices, :foreign_key => 'to_user_id', :class_name => "UserNotice"
  has_many :topic_read_histories

  has_many :liked_resources
  has_many :liked_topics,    :class_name => 'Topic', :through => :liked_resources,    :source => :liked_resource,    :source_type => :Topic
  has_many :liked_photos,    :class_name => 'Album', :through => :liked_resources,    :source => :liked_resource,    :source_type => :Album
  has_many :followed_resources
  has_many :followed_topics, :class_name => 'Topic', :through => :followed_resources, :source => :followed_resource, :source_type => :Topic
  has_many :followed_photos, :class_name => 'Album', :through => :followed_resources, :source => :followed_resource, :source_type => :Album


  def email=(address)
    write_attribute(:email, address) if new_record?
  end

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
    attribute_array = %w(nickname email number)
    attribute_array.each do |attribute|
      return false if self.send(attribute).blank?
    end
    return true
  end

  def update_password params
    params.select! { |key| [:current_password, :password, :password_confirmation]}
    update_with_password params
  end

  def uncompleted_print
    self.prints.where(is_completed: false).all.first
  end
end