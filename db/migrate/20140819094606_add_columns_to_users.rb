class AddColumnsToUsers < ActiveRecord::Migration
  def change

	add_column :users, :salutation, :string
	add_column :users, :title, :string
	add_column :users, :division, :string
	add_column :users, :region, :string
	add_column :users, :company_email, :string
	add_column :users, :company_phone, :string
    add_column :users, :company_mailing_street_address_1, :string
    add_column :users, :company_mailing_street_address_2, :string
    add_column :users, :company_mailing_state_or_province, :string
    add_column :users, :company_mailing_country, :string
    add_column :users, :company_mailing_postal_code, :string
    add_column :users, :personal_email, :string
    add_column :users, :personal_phone, :string
    add_column :users, :personal_mailing_street_address, :string
    add_column :users, :emergency_contact_mailing_city, :string
    add_column :users, :emergency_contact_mailing_street_2, :string
    add_column :users, :emergency_contact_mailing_street_1, :string
    add_column :users, :emergency_contact_relationship, :string
    add_column :users, :emergency_contact_phone_number, :string
    add_column :users, :emergency_contact_email, :string
    add_column :users, :emergency_contact_last_name, :string
    add_column :users, :emergency_contact_first_name, :string
    add_column :users, :identification_photo, :string
    add_column :users, :federal_id_number, :string
    add_column :users, :country_of_residence, :string
    add_column :users, :country_of_citizenship, :string
    add_column :users, :birthday, :string
    add_column :users, :date_of_hire, :string
    add_column :users, :personal_mailing_country, :string
    add_column :users, :personal_mailing_postal_code, :string
    add_column :users, :personal_mailing_state_or_province, :string
    add_column :users, :personal_mailing_city, :string
    add_column :users, :personal_mailing_street_2, :string
 
  end
end
