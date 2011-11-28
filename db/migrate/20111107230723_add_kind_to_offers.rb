class AddKindToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :kind, :string, null: false, default: "sell"
  end
end
