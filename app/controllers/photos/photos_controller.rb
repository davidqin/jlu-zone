# coding: utf-8
class Photos::PhotosController < ApplicationController
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Photos
  before_filter :authenticate_user!,    :except => [:show, :index]
  load_and_authorize_resource

  def index
    @photos = Photo.order("created_at desc").all
    drop_breadcrumb(itext("navigation.photos"), photos_path)
    do_not_use_sidebar
    render "photos/index"
  end

  def new
    @photo = current_user.photos.new
    5.times do 
      @photo.photo_line_items.build
    end
    render "photos/new"
  end

  def show
    @photo = Photo.find(params[:id])
    render "photos/show"
  end

  def edit
    @photo = current_user.photos.find(params[:id])
    render "photos/edit"
  end

  def create    
    @photo = current_user.photos.new(model_params)
    if @photo.save
      redirect_to_as_create_success photos_path
    else
      render_as_create_fail :new
    end
  end

  def update
    @photo = current_user.photos.find(params[:id])
    if @photo.update_attributes(model_params)
      redirect_to_as_update_success photos_path
    else
      render_as_update_fail :edit
    end
  end

  def destroy
    Photo.find(params[:id]).destroy
    redirect_to_as_destroy_success "/photos"
  end
end
