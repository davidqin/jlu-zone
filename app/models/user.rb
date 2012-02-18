require 'digest/sha2'
class User < ActiveRecord::Base
  attr_protected :hashed_password
  attr_accessor :password

  before_save :encrypt_password
  
  validates :name, :presence => {:message => itext('user.validate_name_presence')}
  validates :password,
    :presence => {:message => itext('users_user.validate_password_presence'), :on => :create},
    :length   => {:allow_blank => true, :within => 6..20, :too_short => itext('users_user.validate_password_too_short'), :too_long => itext('users_user.validate_password_too_long')},
    :confirmation => {:message => itext('users_user.validate_password_confirmation')}

  def encrypt_password
    self.hashed_password = User.encrypt_password(password) unless password.blank?
  end

  def self.encrypt_password(string)
    return Digest::SHA256.hexdigest(string)
  end
end
