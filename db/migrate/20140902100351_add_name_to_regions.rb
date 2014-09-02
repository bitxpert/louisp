class AddNameToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :name, :string
  end
end
