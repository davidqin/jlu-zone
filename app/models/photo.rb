class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :photo_line_items, :dependent => :destroy
  has_many   :followed_resources, :as => :resource
  accepts_nested_attributes_for :photo_line_items, :allow_destroy => true,:reject_if => :all_blank
end