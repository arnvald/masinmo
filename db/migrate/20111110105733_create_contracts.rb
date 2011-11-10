class CreateContracts < ActiveRecord::Migration
  def up
    create_table :contracts do |t|
      t.integer :advertiser_id
      t.date :start_at
      t.date :finish_at
      t.integer :placement_id
    end
  end

  def down
    drop_table :contracts
  end
end
