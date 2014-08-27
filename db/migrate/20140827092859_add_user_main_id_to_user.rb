class AddUserMainIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_main_id, :string
  end
end
