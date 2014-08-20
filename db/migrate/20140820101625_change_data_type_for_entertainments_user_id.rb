class ChangeDataTypeForEntertainmentsUserId < ActiveRecord::Migration
  def change
  	remove_column :entertainments, :user_id
  	add_column :entertainments, :user_id,  :integer
  end
end
