class CreateAdvertisers < ActiveRecord::Migration
  def up
    create_table :advertisers do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
    end
  end

  def down
    drop_table :advertisers
  end
end
