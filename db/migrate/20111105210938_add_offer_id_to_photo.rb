class AddOfferIdToPhoto < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.integer :offer_id
    end
  end
end
