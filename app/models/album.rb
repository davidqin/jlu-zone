class Album < ActiveRecord::Base
  belongs_to :user
  has_many   :photos, :dependent => :destroy
  has_many   :followed_resources, :as => :resource
  accepts_nested_attributes_for :photos, :allow_destroy => true,:reject_if => :all_blank
end