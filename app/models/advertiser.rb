class Advertiser < ActiveRecord::Base

  has_many :contracts, dependent: :destroy

  validates :phone, presence: true
  validates :name, presence: true
  validates :email, presence: true

end
