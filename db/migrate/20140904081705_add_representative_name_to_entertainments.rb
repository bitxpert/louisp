class AddRepresentativeNameToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :representative_name, :string
  end
end
