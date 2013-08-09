# coding: utf-8
class Photo < ActiveRecord::Base
  include Wiki::Models::Scores::LimitPerDay

  belongs_to :album
  belongs_to :fonder, :class_name => "User"

  def img_url=(arg)
    if arg.is_a? String
      self.send :remote_img_url_url=, arg
    else
      super(arg)
    end
  end

  def self.create_score
    10
  end

  def self.score_times
    3
  end
end