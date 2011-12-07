class AddExpiryDateToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :expiry_date, :date, null: false
  end
end
