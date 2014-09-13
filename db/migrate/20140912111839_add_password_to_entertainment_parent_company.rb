class AddPasswordToEntertainmentParentCompany < ActiveRecord::Migration
  def change
    add_column :entertainment_parent_companies, :password, :string
  end
end
