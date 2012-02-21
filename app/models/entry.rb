class Entry < ActiveRecord::Base
  validates :name, :presence => {:message => itext('entry.validate_name_presence')}
end
