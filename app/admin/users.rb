ActiveAdmin.register User do
  scope :all, :default => true

  index do
    column :email
    column :first_name
    column :last_name
    column :country
    column :city
    column :active
    column :admin
    column do |user|
      if user.active?
        link_to 'Block', deactivate_admin_user_path(user), method: :post
      else
        link_to 'Unblock', activate_admin_user_path(user), method: :post
      end
    end
    column  {|user|  link_to 'View', admin_user_path(user) }
    column  {|user|  link_to 'Edit', edit_admin_user_path(user) }
    column {|user| link_to 'Delete', admin_user_path(user), method: :delete, confirm: "Are you sure?"}
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :country
  filter :city
  filter :active

  form do |f|
    f.inputs "info" do
      f.input :first_name
      f.input :last_name
      f.input :country
      f.input :city
      f.input :active
      f.input :postal_code
      f.input :phone
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

  member_action :activate, method: :post do
    user = User.find(params[:id])
    user.update_attribute(:active, true)
    redirect_to action: :index
  end

  member_action :deactivate, method: :post do
    user = User.find(params[:id])
    user.update_attribute(:active, false)
    user.offers.map(&:hide!)
    redirect_to action: :index
  end
end

