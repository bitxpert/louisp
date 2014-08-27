class AddRegionUserNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :region_user_number, :integer
  end
end
