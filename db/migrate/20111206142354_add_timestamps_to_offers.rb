class AddTimestampsToOffers < ActiveRecord::Migration
  def up
    change_table :offers do |t|
      t.timestamps
    end
  end

  def down
    remove_column :offers, :created_at
    remove_column :offers, :updated_at
  end
end
