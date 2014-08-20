class ChangeDataTypeForEntertainmentsUserId < ActiveRecord::Migration
  def change
  	change_column :entertainments, :user_id,  :integer
  end
end
