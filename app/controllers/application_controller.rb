class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email,:role_id,:division_id, :region_user_number, :parent_region, :region_id,:user_main_id,:company_mailing_state_or_province, :password, :password_confirmation, :first_name, :middle_name, :last_name, :sex, :age) }
    devise_parameter_sanitizer.for(:account_update) << :salutation
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :middle_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :sex
    devise_parameter_sanitizer.for(:account_update) << :age
    devise_parameter_sanitizer.for(:account_update) << :title
    devise_parameter_sanitizer.for(:account_update) << :division
    devise_parameter_sanitizer.for(:account_update) << :region
    devise_parameter_sanitizer.for(:account_update) << :company_email
    devise_parameter_sanitizer.for(:account_update) << :company_phone
    devise_parameter_sanitizer.for(:account_update) << :company_mailing_street_address_1
    devise_parameter_sanitizer.for(:account_update) << :company_mailing_street_address_2
    devise_parameter_sanitizer.for(:account_update) << :company_mailing_state_or_province
    devise_parameter_sanitizer.for(:account_update) << :company_mailing_country
    devise_parameter_sanitizer.for(:account_update) << :company_mailing_postal_code
    devise_parameter_sanitizer.for(:account_update) << :personal_email
    devise_parameter_sanitizer.for(:account_update) << :personal_phone
    devise_parameter_sanitizer.for(:account_update) << :personal_mailing_street_address
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_mailing_city
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_mailing_street_2
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_mailing_street_1
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_relationship
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_phone_number
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_email
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_last_name
    devise_parameter_sanitizer.for(:account_update) << :emergency_contact_first_name
    devise_parameter_sanitizer.for(:account_update) << :identification_photo
    devise_parameter_sanitizer.for(:account_update) << :federal_id_number
    devise_parameter_sanitizer.for(:account_update) << :country_of_residence
    devise_parameter_sanitizer.for(:account_update) << :country_of_citizenship
    devise_parameter_sanitizer.for(:account_update) << :birthday
    devise_parameter_sanitizer.for(:account_update) << :date_of_hire
    devise_parameter_sanitizer.for(:account_update) << :personal_mailing_country
    devise_parameter_sanitizer.for(:account_update) << :personal_mailing_postal_code
    devise_parameter_sanitizer.for(:account_update) << :personal_mailing_state_or_province
    devise_parameter_sanitizer.for(:account_update) << :personal_mailing_city
    devise_parameter_sanitizer.for(:account_update) << :personal_mailing_street_2
    devise_parameter_sanitizer.for(:account_update) << :parent_region
    
  end

 
end
