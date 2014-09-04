class AddDivisionToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :division, :string
  end
end
