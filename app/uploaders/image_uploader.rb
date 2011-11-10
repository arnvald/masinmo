# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  process :resize_to_fit => [600, 600]

   version :thumb do
     process :resize_to_fit => [100, 100]
   end

   version :search do
     process :resize_to_fit => [200, 200]
   end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "/images/fallback/" + [version_name, "default.jpg"].compact.join('_')
  end
end
