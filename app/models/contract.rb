class Contract < ActiveRecord::Base

  belongs_to :advertiser
  belongs_to :placement

  validates :advertiser, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :placement, presence: true
  validate :correct_dates

  mount_uploader :banner, BannerUploader

  scope :active, lambda { where("start_at <= ? and finish_at >= ?", Date.today, Date.today)}

  def correct_dates
    errors.add("start_at", "dates incorrect") if finish_at < start_at
  end

end
