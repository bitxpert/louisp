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
  permit_params do
    permitted = [:email,:password, :password_confirmation ,:permitted,  :salutation, :title, :division, :region, :company_email, :company_phone, :company_mailing_street_address_1, :company_mailing_street_address_2, :company_mailing_state_or_province, :company_mailing_country, :company_mailing_postal_code, :personal_email, :personal_phone, :personal_mailing_street_address, :emergency_contact_mailing_city, :emergency_contact_mailing_street_2, :emergency_contact_mailing_street_1, :emergency_contact_relationship, :emergency_contact_phone_number, :emergency_contact_email, :emergency_contact_last_name, :emergency_contact_first_name, :identification_photo, :federal_id_number, :country_of_residence, :country_of_citizenship, :birthday, :date_of_hire, :personal_mailing_country, :personal_mailing_postal_code, :personal_mailing_state_or_province, :personal_mailing_city, :personal_mailing_street_2]
  end
  #controller do
    
  #  def create
      
  #    @user = User.new(permit_parms)
  #    puts "===================================================================="
  #   puts permit_parms
  #    puts "===================================================================="
  #    if @user.save
  #      @message = "User Sucessfully Created"
  #    else
  #      @message = "User not Created" 
  #    end 
  #    redirect_to admin_users_path, :notice => @message
      #super
  #  end

  #  def permit_parms
  #     params.require(:user).permit(:email,:password,:permitted, :password_confirmation,  :salutation, :title, :division, :region, :company_email, :company_phone, :company_mailing_street_address_1, :company_mailing_street_address_2, :company_mailing_state_or_province, :company_mailing_country, :company_mailing_postal_code, :personal_email, :personal_phone, :personal_mailing_street_address, :emergency_contact_mailing_city, :emergency_contact_mailing_street_2, :emergency_contact_mailing_street_1, :emergency_contact_relationship, :emergency_contact_phone_number, :emergency_contact_email, :emergency_contact_last_name, :emergency_contact_first_name, :identification_photo, :federal_id_number, :country_of_residence, :country_of_citizenship, :birthday, :date_of_hire, :personal_mailing_country, :personal_mailing_postal_code, :personal_mailing_state_or_province, :personal_mailing_city, :personal_mailing_street_2)
  #  end  

  #end 
  


end
