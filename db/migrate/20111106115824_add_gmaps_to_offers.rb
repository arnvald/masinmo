class AddGmapsToOffers < ActiveRecord::Migration
  def change
    change_table :offers do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
    end
  end
end
