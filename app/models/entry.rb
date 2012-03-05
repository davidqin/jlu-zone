class Entry < ActiveRecord::Base
  include Wiki::Models::CreateVersion
  
  attr_accessor :new_version_content
  attr_accessor :new_version_editor

  has_many   :versions, :order => "created_at", :dependent => :destroy

  belongs_to :fonder, :class_name => "User"
  belongs_to :category

  validates  :name, :presence => {:message => "can't be empty"}

  def self.create_entry(params, user)
    entry        = self.new
    entry.fonder = user
    return entry
  end

  def update_entry(params, user)
    self.new_version_editor   = user
    self.new_version_content  = self.content
    self.update_attributes(params)
  end
  
  def last_editor_name
    if self.last_editor
      self.last_editor.nickname 
    else 
      ""
    end
  end

  def last_editor
    self.versions.order(:created_at).last.editor
  end

  def history_versions_size
    self.versions.size
  end
  
  def fonder_name
    self.fonder.nickname
  end

  def link_to_category_entry
    [self.category, self]
  end
end
