class AddEeUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ee_user_id, :integer
  end
end
