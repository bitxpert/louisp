class CreateFunnyImages < ActiveRecord::Migration
  def change
    create_table :funny_images do |t|

      t.timestamps
    end
  end
end
