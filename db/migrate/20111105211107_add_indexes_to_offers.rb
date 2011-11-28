class AddIndexesToOffers < ActiveRecord::Migration
  def change
    add_index :offers, :state
    add_index :offers, :user_id
    add_index :offers, :country
    add_index :offers, :city
  end
end
