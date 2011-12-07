class AddTitleToComments < ActiveRecord::Migration
  def change
    add_column :comments, :title, :string, null: false
  end
end
