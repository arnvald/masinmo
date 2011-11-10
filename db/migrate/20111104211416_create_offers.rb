class CreateOffers < ActiveRecord::Migration
  def up
    create_table :offers do |t|
      t.integer :user_id
      t.string :title
      t.string :summary
      t.string :description
      t.string :street
      t.string :building
      t.string :city
      t.string :region
      t.string :country
    end
  end

  def down
    drop_table :offers
  end
end
