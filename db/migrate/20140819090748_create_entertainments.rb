class CreateEntertainments < ActiveRecord::Migration
  def change
    create_table :entertainments do |t|
  
  	  t.string :region
      t.string :representative_id
      t.string :url
      t.string :name
      t.string :sub_category
      t.string :function
      t.string :category
      t.string :icon
      t.string :email
      t.string :phone_number
      t.string :country
      t.string :state_or_province
      t.string :city
      t.string :street_address_1
      t.string :street_address_2
      t.string :postal_code
      t.string :contact_person_first_name
      t.string :contact_person_last_name
      t.string :url_picture
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
      t.string :password
      t.string :user_id
      t.string :contact_person_position
      t.string :contact_person_phone
      t.string :contact_person_email
      t.string :contact_person_salutation

      t.timestamps
    end
  end
end
