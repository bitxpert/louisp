class CreateAssignedRegions < ActiveRecord::Migration
  def change
    create_table :assigned_regions do |t|
      t.integer :user_id
      t.integer :region_id	
      t.timestamps
    end
  end
end
