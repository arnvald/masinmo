class AddBannerToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :banner, :string
  end
end
