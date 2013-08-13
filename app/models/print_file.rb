class PrintFile < ActiveRecord::Base
  mount_uploader :url, PrintFileUploader

  attr_accessible :url, :name, :size
  belongs_to :print_item

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "name" => name,
        "size" => size,
        "url"  => "upload.url(:original)",
        "delete_url" => print_item_file_path(self.print_item.print, self.print_item, self),
        "delete_type" => "DELETE"
    }
  end
end