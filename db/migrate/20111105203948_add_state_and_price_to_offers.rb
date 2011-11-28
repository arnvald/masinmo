class AddStateAndPriceToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :price, :float, null: false, default: 0.0
    add_column :offers, :state, :string, null: false, default: "draft"
  end
end
