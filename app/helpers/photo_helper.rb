module PhotoHelper
	def index_pic
		image = Photo.find_by_id(15)
		html_contents do |contents|
			contents << image_tag(image.img_url)
			contents << link_to(itext("psindex"), photos_path, :class => :cov)
			contents << content_tag(:p)
			contents << contents_tag(:a, :class => "picowner", :href => user_path(image.fonder)) do |items|
				items << show_user_portrait(image.fonder, :link => false)
				if image.album
					items << image.fonder.nickname
					items << tag(:br)
					items << itext("photo.share_to_album", :album => image.album.name)
				else
					items << itext("photo.share_to", :user => image.fonder.nickname)
				end
			end
		end
	end
end