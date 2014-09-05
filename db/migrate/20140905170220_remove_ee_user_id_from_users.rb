class RemoveEeUserIdFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :ee_user_id
  end
end
