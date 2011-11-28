class AddOfferIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :offer_id, :integer
  end
end
