class CreatePlacements < ActiveRecord::Migration
  def up
    create_table :placements do |t|
      t.string :name
    end
  end

  def down
    drop_table :placements
  end
end
