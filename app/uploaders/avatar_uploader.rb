# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :convert => 'jpg'
  process :crop

  version :size64 do
    process :resize_to_fill => [64, 64]
  end

  version :size48 do
    process :resize_to_fill => [48, 48]
  end

  version :size18 do
    process :resize_to_fill => [18, 18]
  end

  def crop
    width = model.a_x2.to_i - model.a_x1.to_i
    height= model.a_y2.to_i - model.a_y1.to_i

    geometry = "#{width}x#{height}+#{model.a_x1.to_i}+#{model.a_y1.to_i}"

    manipulate! do |img|
      img.crop(geometry)
      img
    end
  end

  # process :resize_to_fit => [200, 200]
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    'avatar.jpg'
  end

end
