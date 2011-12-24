ActiveAdmin.register User do
  scope :all, :default => true

  index do
    column :email
    column :admin
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "info" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end

