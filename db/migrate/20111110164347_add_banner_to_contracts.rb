class AddBannerToContracts < ActiveRecord::Migration
  def change
    change_table :contracts do |t|
      t.string :banner
    end
  end
end
