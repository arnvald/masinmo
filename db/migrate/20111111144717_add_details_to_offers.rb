class AddDetailsToOffers < ActiveRecord::Migration
  def change
    change_table :offers do |t|
      t.integer :rooms
      t.integer :bathrooms
      t.string :property_type
      t.boolean :internet, default: false
      t.boolean :furnished, default: false
    end
  end
end
