class Entry < ActiveRecord::Base
  include Wiki::Models::CreateVersion
  
  attr_accessor :new_version_content
  attr_accessor :new_version_editor

  has_many   :versions

  belongs_to :fonder, :class_name => "User"
  belongs_to :category

  validates  :name, :presence => {:message => "can't be empty"}

  def self.create_entry(params, user)
    entry        = self.new
    entry.name   = params[:name]
    entry.fonder = user
    entry.new_version_content = params[:content]
    return entry
  end

  def update_entry(params, user)
    self.new_version_editor   = user
    self.new_version_content  = params[:content]
    self.update_attribute(:name, params[:name])
    self.update_attribute(:updated_at, Time.now)
  end
  
  def last_editor_name
    if self.last_editor
      self.last_editor.nickname 
    else 
      ""
    end
  end

  def last_editor
    self.versions.order(:number).last.editor
  end

  def history_versions_size
    self.versions.size
  end
  
  def fonder_name
    self.fonder.nickname
  end

  def fonder_path
    self.fonder.to_param
  end
end
