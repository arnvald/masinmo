class Offer < ActiveRecord::Base

  STATES = ["draft", "published", "archived"]
  KINDS = ["sell", "rent"]
  PROPERTY_TYPES = ["house", "flat"]

  acts_as_gmappable check_process: :prevent_geocoding, msg: "Wrong address"
  paginates_per 20

  belongs_to :user
  has_many :photos

  validates :title, presence: true, if: :published?
  validates :country, presence: true, if: :published?
  validates :city, presence: true, if: :published?
  validates :street, presence: true, if: :published?
  validates :price, presence: true, numericality: {greater_than: 0}, if: :published?
  validates :state, presence: true, inclusion: STATES
  validates :kind, presence: true, inclusion: KINDS
  validates :property_type, presence: true, inclusion: PROPERTY_TYPES

  scope :published, where(state: "published")
  scope :drafts, where(state: "draft")
  scope :archived, where(state: "archived")

  scope :by_country, lambda {|c| where(country: c)}
  scope :by_region, lambda {|r| where(country: r)}

  accepts_nested_attributes_for :photos

  # ========
  # MAPS
  # ========
  def gmaps4rails_address
    [street, building, city, country].select{|x| x != ""}.join(', ')
  end

  def gmaps4rails_infowindow
    "<h3><a id='offer_#{id}' href='#'>#{title}</a></h3> <img src = '#{photos.first.image.thumb.url}' /> <p>#{summary}</p><p>#{gmaps4rails_address}</p><p>#{price}</p>"
  end

  def owned_by?(user)
    self.user == user
  end

  def hide!
    self.state = "draft"
    save(validate: false)
  end

  def publish!
    update_attribute(:state, "published")
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
  def prevent_geocoding
    country.blank? && city.blank? && street.blank?
  end
end
