module Wiki::Models::CreateVersion
  def self.included(base)
    base.after_create  :create_first_version
    base.after_update  :create_new_version
  end

  def create_first_version
    version         = self.versions.new
    version.content = self.new_version_content
    version.editor  = self.fonder
    version.save
  end

  def create_new_version
    version         = self.versions.new
    version.content = self.new_version_content
    version.editor  = self.new_version_editor
    version.save
  end
end