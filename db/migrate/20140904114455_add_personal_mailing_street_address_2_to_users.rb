class AddPersonalMailingStreetAddress2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :personal_mailing_street_address_2, :string
  end
end
