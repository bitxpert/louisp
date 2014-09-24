class AddPasswordCloneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_clone, :string
  end
end
