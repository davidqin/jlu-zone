class Photos::RecentPhotosController < ApplicationController
  def recent_photos
    @photos = Photo.order("created_at desc").limit(10)
    respond_to do |format|
      format.json { render "photos/recent_photos", :layout => false}
    end
  end
end