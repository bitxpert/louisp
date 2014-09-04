class AddWebpageDirectorFirstNameToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :webpage_director_first_name, :string
  end
end
