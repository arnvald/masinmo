class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :image
      t.string :title
      t.string :description
    end
  end

  def down
    drop_table :photos
  end
end
