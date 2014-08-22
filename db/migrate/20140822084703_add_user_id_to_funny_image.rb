class AddUserIdToFunnyImage < ActiveRecord::Migration
  def change
    add_column :funny_images, :user_id, :integer
    add_column :funny_images, :image, :string
  end
end
