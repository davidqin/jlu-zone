class PhotoLineItem < ActiveRecord::Base
  mount_uploader :img_url, AvatarUploader
  belongs_to :photo

  def img_url
    return if self.new_record?
    image_url = super
    url_array = image_url.url.split("http:/")
    if url_array.size > 1
      return "http://" + url_array.last
    else
      image_url
    end
  end

  def img_url=(arg)
binding.pry
    if arg.is_a? String

      arg
    else
      super(arg)
    end    
  end
end