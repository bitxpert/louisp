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
EntertainmentParentCompany.create(id: ,parent_company_postal_code: '', parent_company_street_address_2: '', parent_company_street_address_1: '', parent_company_city: '', parent_company_contact_person_salutation: '', parent_company_state_or_province: '', parent_company_contact_person_email_address: '', parent_company_contact_person_last_name: '', parent_company_country: '', parent_company_contact_person_phone_number: '', parent_company_contact_person_first_name: '', parent_comapny_name: '', webpage_director_phone_number: '', webpage_director_email_address: '', webpage_director_salutation: '', webpage_director_salutation: '', webpage_director_last_name: '', webpage_director_contact_person_first_name: '', webpage_director_company: '', webpage_director_first_name: '', webpage_director_skype_id: '', password: '', parent_company_contact_person_skype_id: '')