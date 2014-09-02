class AddRegionIdToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :region_id, :integer
  end
end
