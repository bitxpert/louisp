class DropEeUserIdFromEntertainments < ActiveRecord::Migration
  def change
  	remove_column :entertainments, :ee_user_id
  end
end
