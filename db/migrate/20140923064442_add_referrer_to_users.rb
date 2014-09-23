class AddReferrerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referrer, :integer
  end
end
