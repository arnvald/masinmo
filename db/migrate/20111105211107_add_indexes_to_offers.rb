class AddIndexesToOffers < ActiveRecord::Migration
  def change
    change_table :offers do |t|
      t.index :state
      t.index :user_id
      t.index :country
      t.index :city
    end
  end
end
