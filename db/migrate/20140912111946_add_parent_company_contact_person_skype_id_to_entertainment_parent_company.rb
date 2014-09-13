class AddParentCompanyContactPersonSkypeIdToEntertainmentParentCompany < ActiveRecord::Migration
  def change
    add_column :entertainment_parent_companies, :parent_company_contact_person_skype_id, :string
  end
end
