class AddEeUserIdToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :ee_user_id, :integer
  end
end
