class Placement < ActiveRecord::Base

  has_many :contracts

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
