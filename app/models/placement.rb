class Placement < ActiveRecord::Base

  has_many :contracts

  validates :name, presence: true, uniqueness: true

end
