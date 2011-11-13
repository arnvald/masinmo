class Offer < ActiveRecord::Base

  STATES = ["draft", "published", "archived"]
  KINDS = ["sell", "rent"]

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

  scope :published, where(state: "published")
  scope :drafts, where(state: "draft")
  scope :archived, where(state: "archived")

  accepts_nested_attributes_for :photos

  # ========
  # MAPS
  # ========
  def gmaps4rails_address
    [street, building, city, country].select{|x| x != ""}.join(', ')
  end

  def gmaps4rails_infowindow
    "<h3>#{title}</h3> <img src = '#{photos.first.image.thumb.url}' /> <p>#{summary}</p>"
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
