# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  process :resize_to_fit => [600, 600]

   version :search do
     process :resize_and_pad => [90, 90]
   end

   version :thumb do
     process :resize_and_pad => [210, 150]
   end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "/assets/fallback/" + [version_name, "default.jpg"].compact.join('_')
  end
end
