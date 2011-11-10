class AddKindToOffers < ActiveRecord::Migration
  def change
    change_table :offers do |t|
      t.string :kind, null: false, default: "sell"
    end
  end
end
