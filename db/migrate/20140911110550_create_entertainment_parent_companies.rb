class CreateEntertainmentParentCompanies < ActiveRecord::Migration
  def change
    create_table :entertainment_parent_companies do |t|

      t.string :parent_company_postal_code
      t.string :parent_company_street_address_2
      t.string :parent_company_street_address_1
      t.string :parent_company_city	
      t.string :parent_company_contact_person_salutation
      t.string :parent_company_state_or_province
      t.string :parent_company_contact_person_email_address
      t.string :parent_company_contact_person_last_name
      t.string :parent_company_country
      t.string :parent_company_contact_person_phone_number
      t.string :parent_company_contact_person_first_name
      t.string :parent_comapny_name	
      t.string :webpage_director_phone_number
      t.string :webpage_director_email_address
      t.string :webpage_director_salutation
      t.string :webpage_director_last_name
      t.string :webpage_director_contact_person_first_name
      t.string :webpage_director_company
      t.string :webpage_director_first_name
      t.string :webpage_director_skype_id

      t.timestamps
    end
  end
end
