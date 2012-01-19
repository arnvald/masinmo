class Offer < ActiveRecord::Base

  STATES = ["draft", "published", "archived"]
  KINDS = ["sell", "rent"]
  PROPERTY_TYPES = ["house", "flat"]

  paginates_per 20

  belongs_to :user
  has_many :photos
  has_many :favorites, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, length: {minimum: 15, maximum: 100}
  validates :country, presence: true, if: :published?
  validates :city, presence: true, if: :published?
  validates :street, presence: true,if: :published? 
  validates :price, presence: true, numericality: {greater_than: 0}, if: :published?
  validates :state, inclusion: STATES
  validates :kind, inclusion: KINDS, if: :published?
  validates :property_type, inclusion: PROPERTY_TYPES, if: :published?

  acts_as_gmappable process_geocoding: false, check_process: true, msg: "Wrong address"

  scope :published, lambda {where("state = ? and expiry_date >= ?", 'published', Date.today)}
  scope :drafts, where(state: "draft")
  scope :archived, where(state: "archived")

  scope :by_country, lambda {|c| where(country: c)}
  scope :by_region, lambda {|r| where(country: r)}

  accepts_nested_attributes_for :photos

  # ========
  # MAPS
  # ========
  def gmaps4rails_address
    [street, building, city, country].select{|x| x && x != ""}.join(', ')
  end

  def gmaps4rails_infowindow
    ActionView::Base.new(Rails.configuration.paths.app.views.first).render(:partial => "offers/marker", :locals => {:offer => self}).gsub("\n","").gsub('"','\'')
  end

  def owned_by?(user)
    self.user == user
  end

  def hide!
    update_attribute(:state, "draft")
  end

  def publish!
    self.state = "published"
    set_expiry_date
    process_geocoding
    save
  end

  def archive!
    update_attribute(:state, "archived")
  end

  STATES.each do |state|
    define_method "#{state}?" do
      self.state == state
    end
  end

  private
  def set_expiry_date
    self.expiry_date = Date.today + 2.weeks
  end
end
