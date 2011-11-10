class AddStateAndPriceToOffers < ActiveRecord::Migration
  def change
    change_table :offers do |t|
      t.float :price, :null => false, :default => 0.0
      t.string :state, :null => false, :default => "draft"
    end
  end
end
