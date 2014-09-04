class AddEmergencyContactMailingCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emergency_contact_mailing_country, :string
  end
end
