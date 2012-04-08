# coding: utf-8
class Photos::PhotosController < ApplicationController
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Photos
  before_filter :authenticate_user!,    :except => [:show, :index]
  load_and_authorize_resource

  def index
    @albums = Album.order("created_at desc").all
    drop_breadcrumb(itext("navigation.photos"), photos_path)
    do_not_use_sidebar
    render "photos/index"
  end

  def new
    @album = current_user.albums.new
    5.times do 
      @album.photos.build
    end
    render "photos/new"
  end

  def show
    @album = Album.find(params[:id])
    render "photos/show"
  end

  def edit
    @album = current_user.albums.find(params[:id])
    render "photos/edit"
  end

  def create    
    @album = current_user.albums.new(model_params)
    if @album.save
      redirect_to_as_create_success photos_path
    else
      render_as_create_fail :new
    end
  end

  def update
    @album = current_user.albums.find(params[:id])
    if @album.update_attributes(model_params)
      redirect_to_as_update_success photos_path
    else
      render_as_update_fail :edit
    end
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to_as_destroy_success "/photos"
  end
end
