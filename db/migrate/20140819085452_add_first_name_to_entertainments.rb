class AddFirstNameToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :first_name, :string
  end
end
