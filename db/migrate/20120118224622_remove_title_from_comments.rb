class RemoveTitleFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :title
  end

  def down
    add_column :comments, :title, :string, null: false
  end
end
