class ChangePriceCanBeNull < ActiveRecord::Migration
  def up
    change_column :offers, :price, :float, null: true
  end

  def down
    change_column :offers, :price, :float, null: false, default: 0.0
  end
end
