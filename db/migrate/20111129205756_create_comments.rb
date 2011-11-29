class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :offer_id
      t.string :body
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :offer_id
  end

  def down
    drop_table :comments
  end
end
