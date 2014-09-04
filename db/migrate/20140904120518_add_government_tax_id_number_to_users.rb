class AddGovernmentTaxIdNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :government_tax_id_number, :string
  end
end
