ActiveAdmin.register Advertiser do
  scope :all, default: true

  show do
    render "advertiser", advertiser: advertiser
  end
end
