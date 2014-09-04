class AddParentCompanyContactPersonSkypeIdToEntertainments < ActiveRecord::Migration
  def change
    add_column :entertainments, :parent_company_contact_person_skype_id, :string
  end
end
