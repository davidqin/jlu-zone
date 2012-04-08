class Photo < ActiveRecord::Base
  mount_uploader :img_url, AvatarUploader
  belongs_to :album

  def img_url=(arg)
    if arg.is_a? String
      self.send :remote_img_url_url=, arg
    else
      super(arg)
    end
  end
end