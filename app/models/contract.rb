class Contract < ActiveRecord::Base

  belongs_to :advertiser
  belongs_to :placement

  validates :advertiser, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :placement, presence: true
  validate :correct_dates
  validate :free_dates

  mount_uploader :banner, BannerUploader

  scope :active, lambda { where("start_at <= ? and finish_at >= ?", Date.today, Date.today)}
  scope :of_placement, lambda {|pid| where(placement_id: pid) }

  def correct_dates
    errors.add("start_at", "dates incorrect") if finish_at < start_at
  end

  def free_dates
    taken_days = Contract.days_taken(placement_id)
    self_days = (start_at..finish_at).to_a

    errors.add("start_at", "date already taken") unless (self_days & taken_days).empty?
  end

  def self.days_taken(placement_id)
    Contract.of_placement(placement_id).map {|c| (c.start_at..c.finish_at).to_a}.flatten
  end

end
