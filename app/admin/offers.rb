ActiveAdmin.register Offer do
  scope :all, :default => true
  scope :drafts
  scope :published

  filter :title
  filter :user
  filter :city
  filter :country
end
