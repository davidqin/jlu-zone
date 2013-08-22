# encoding: utf-8

class PrintFile < ActiveRecord::Base
  mount_uploader :url, PrintFileUploader

  attr_accessible :url, :name, :size

  belongs_to :print_item

  validate :file_size

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "name" => name,
        "size" => size,
        "url"  => "You Can not download File Here",
        "delete_url" => print_item_file_path(self.print_item.print, self.print_item, self),
        "delete_type" => "DELETE"
    }
  end

  def file_size
    if url.file.size.to_f / (1000*1000) > 10
      errors.add(:url, "文件不成超过10M")
    end
  end
end