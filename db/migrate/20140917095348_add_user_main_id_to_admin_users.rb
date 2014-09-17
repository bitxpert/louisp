class AddUserMainIdToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :user_main_id, :integer
  end
end
