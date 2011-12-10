class AddMoreDetailsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :dishwasher, :boolean, default: false, null: false
    add_column :offers, :washing_machine, :boolean, default: false, null: false
    add_column :offers, :tv, :boolean, default: false, null: false
    add_column :offers, :microwave, :boolean, default: false, null: false
    add_column :offers, :storage_room, :boolean, default: false, null: false
    add_column :offers, :terrace, :boolean, default: false, null: false
    add_column :offers, :balcony, :boolean, default: false, null: false
    add_column :offers, :cable_tv, :boolean, default: false, null: false
    add_column :offers, :heating, :boolean, default: false, null: false
    add_column :offers, :garage, :boolean, default: false, null: false
    add_column :offers, :gym, :boolean, default: false, null: false
    add_column :offers, :tennis_court, :boolean, default: false, null: false
    add_column :offers, :swimming_pool, :boolean, default: false, null: false
  end
end
