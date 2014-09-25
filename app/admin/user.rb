ActiveAdmin.register User do

  remove_filter :company_mailing_state_or_province
  remove_filter :personal_mailing_state_or_province

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # form do |f|
  # f.inputs "User Details" do
  #   f.input :email
  #   f.input :password
  #   f.input :password_confirmation
  #   f.inputs :first_name
  #   f.inputs :last_name
  # end
  #f.actions
 #end
  # index do
  #   column :username
  #   # column :current_sign_in_at
  #   # column :last_sign_in_at
  #   # column :sign_in_count
  #   column :email
  #   actions
  # end

  # Default is :email, but we need to replace this with :username
  filter :username

  # This is the form for creating a new user using the Admin
  # backend. If you have added additional attributes to the
  # User model, you need to include them here.
  form do |f|
    f.inputs "User Details" do
      f.input :user_main_id, :label => 'User ID'
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
      f.input :email
      f.input :country_of_residence, as: :country, :include_blank=>"Select Country"
      f.input :division_id, :label => 'Division', :as => :select, :collection => Division.all.map{|u| [u.name, u.id]}, :include_blank=>"Select Division"
      f.input :role_id, :label => 'Role', :as => :select, :collection => Role.all.map{|u| [u.name, u.id]}, :include_blank=>"Select Division"
      f.input :region_id, :label => 'Region', :as => :select, :collection => Region.all.map{|u| [u.name, u.id]}, :include_blank=>"Select Region"
      f.input :approved, :as => :radio         
    end
    f.actions
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  # controller do
  #   def create
  #     puts "=============================================================="
  #     puts params.inspect
  #     puts "=============================================================="
  #     @user = User.new(permit_parms)
  #    if @user.save
  #      @message = "U Sucessfully Created"
  #    else
  #      @message = "U not Created" 
  #    end 
  #    redirect_to admin_users_path, :notice => @message
  #  end

  #   def permit_parms
  #     params.require(:user).permit(:country_of_residence, :email,:password,:permitted, :password_confirmation,  :salutation, :title, :division_id, :region_id, :company_email, :company_phone, :company_mailing_street_address_1, :company_mailing_street_address_2, :company_mailing_state_or_province, :company_mailing_country, :company_mailing_postal_code, :personal_email, :personal_phone, :personal_mailing_street_address, :emergency_contact_mailing_city, :emergency_contact_mailing_street_2, :emergency_contact_mailing_street_1, :emergency_contact_relationship, :emergency_contact_phone_number, :emergency_contact_email, :emergency_contact_last_name, :emergency_contact_first_name, :identification_photo, :federal_id_number, :country_of_residence, :country_of_citizenship, :birthday, :date_of_hire, :personal_mailing_country, :personal_mailing_postal_code, :personal_mailing_state_or_province, :personal_mailing_city, :personal_mailing_street_2)
  #  end  
  # end

  permit_params do
    permitted = [:approved,:user_main_id,:email,:password,:role_id, :password_confirmation ,:permitted,  :salutation, :title, :division_id, :region_id, :company_email, :company_phone, :company_mailing_street_address_1, :company_mailing_street_address_2, :company_mailing_state_or_province, :company_mailing_country, :company_mailing_postal_code, :personal_email, :personal_phone, :personal_mailing_street_address, :emergency_contact_mailing_city, :emergency_contact_mailing_street_2, :emergency_contact_mailing_street_1, :emergency_contact_relationship, :emergency_contact_phone_number, :emergency_contact_email, :emergency_contact_last_name, :emergency_contact_first_name, :identification_photo, :federal_id_number, :country_of_residence, :country_of_citizenship, :birthday, :date_of_hire, :personal_mailing_country, :personal_mailing_postal_code, :personal_mailing_state_or_province, :personal_mailing_city, :personal_mailing_street_2]
  end
  #controller do
    
   
   

  


end
