ActiveAdmin.register Offer do
  scope :all, default: true
  scope :drafts
  scope :published

  filter :title
  filter :user
  filter :city
  filter :country
  filter :state
  filter :created_at
  filter :expiry_date

  index do
    column :title
    column :user
    column :city
    column :state
    column :country
    column :expiry_date
    default_actions
  end
end
