class AddWebpageDirectorSkypeIdToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :webpage_director_skype_id, :string
  end
end
