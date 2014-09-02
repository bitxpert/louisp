class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|

      t.integer :region_id
      t.string :name
      t.integer :division_id  
      t.timestamps
    end
  end
end
