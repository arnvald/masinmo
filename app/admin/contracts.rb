ActiveAdmin.register Contract do
  scope :all, default: true

  filter :start_at
  filter :finish_at
  filter :advertiser

  form do |f|
    f.inputs "Details" do
      f.input :advertiser
      f.input :placement
      f.input :start_at
      f.input :finish_at
    end
    f.inputs "Banner" do
      f.input :banner, as: :file
      f.input :remove_banner, as: :boolean
    end
    f.buttons
  end
end
