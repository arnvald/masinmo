class CreateFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :offer_id
    end

    add_index :favorites, :user_id
    add_index :favorites, :offer_id
  end

  def down
    drop_table :favorites
  end
end
