ActiveAdmin.register Advertiser do
  scope :all, :default => true

  filter :phone
  filter :name
  filter :email
end

