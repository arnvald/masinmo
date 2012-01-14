class AllowExpiryDateToBeNull < ActiveRecord::Migration
  def up
    change_column :offers, :expiry_date, :date, null: true
  end

  def down
    change_column :offers, :expiry_date, :date, null: false
  end
end
