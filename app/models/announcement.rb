class Announcement < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  scope :for_sidebar, order("created_at DESC").limit(3)
end
