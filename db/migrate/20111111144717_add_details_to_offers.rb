class AddDetailsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :rooms, :integer
    add_column :offers, :bathrooms, :integer
    add_column :offers, :property_type, :string
    add_column :offers, :internet, :boolean, default: false
    add_column :offers, :furnished, :boolean, default: false
  end
end
