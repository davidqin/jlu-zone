class Entry < ActiveRecord::Base
  include Wiki::Models::IdNumberExchange::EntryCategoryNumberIdExchange

  has_paper_trail :skip => [:replies_num]
  
  belongs_to :fonder,      :class_name => "User"
  belongs_to :last_editor, :class_name => "User"
  belongs_to :category,    :class_name => "EntryCategory"
  has_many   :replies,     :as => :resource

  validates_presence_of   :name, :message => "can't be empty"
  validates_uniqueness_of :name, :message => "can't be unique" 

  validates_presence_of   :content, :message => "can't be empty"

  def self.create_entry(params, user)
    entry             = self.new(params)
    entry.fonder      = user
    entry.last_editor = user
    return entry
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

  def link_to_category_entry
    [self.category, self]
  end
end

