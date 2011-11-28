class AddGmapsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
    add_column :offers, :gmaps, :boolean
  end
end
