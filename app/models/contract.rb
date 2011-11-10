class Contract < ActiveRecord::Base

  belongs_to :advertiser
  belongs_to :placement

  validates :advertiser, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :placement, presence: true

  mount_uploader :banner, BannerUploader

  scope :active, lambda { where("start_at <= ? and finish_at >= ?", Date.today, Date.today)}

end
