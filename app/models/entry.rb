# coding: utf-8
class Entry < ActiveRecord::Base
  include Wiki::Models::Scores::NoLimitPerDay

  has_paper_trail :skip => [:replies_num]
  
  belongs_to :fonder,      :class_name => "User"
  belongs_to :last_editor, :class_name => "User"
  has_many   :replies,     :as => :resource

  validates_presence_of   :name, :message => "标题不能空着啊！"
  validates_uniqueness_of :name, :message => "标题不能相同啊！" 
  validates_presence_of   :content, :message => "内容不能空着～"

  def self.create_entry(params, user)
    entry             = self.new(params)
    entry.fonder      = user
    entry.last_editor = user
    return entry
  end

  def self.create_score
    10
  end

  def update_entry(params, user)
    self.last_editor = user
    self.update_attributes(params)
  end
  
  def last_editor_name
    self.last_editor.nickname 
  end

  def history_versions_size
    self.versions.length
  end
  
  def fonder_name
    self.fonder.nickname
  end

end

