class Advertiser < ActiveRecord::Base

  has_many :contracts

  validates :phone, presence: true
  validates :name, presence: true
  validates :email, presence: true

end
