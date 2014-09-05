class AddJobReferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_reference, :string
  end
end
