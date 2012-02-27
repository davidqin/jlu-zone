class Entry < ActiveRecord::Base

  has_many   :versions
  belongs_to :fonder, :class_name => "User"

  validates  :name, :presence => {:message => "can't be empty"}
  
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
