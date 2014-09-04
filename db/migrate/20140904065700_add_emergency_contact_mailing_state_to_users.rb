class AddEmergencyContactMailingStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emergency_contact_mailing_state, :string
  end
end
