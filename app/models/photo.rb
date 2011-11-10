# encoding: utf-8

class Photo < ActiveRecord::Base

  belongs_to :offer
  mount_uploader :image, ImageUploader

end
