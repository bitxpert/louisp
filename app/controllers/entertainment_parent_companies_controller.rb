class EntertainmentParentCompaniesController < ApplicationController
before_filter :authenticate_user!
  
	def index
    respond_to do |format|
    format.html
    format.json { render json: ::EntertainmentsDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @entertainment_parent_company = EntertainmentParentCompany.new
    @entertainment_representative_name = current_user.first_name+" #{current_user.middle_name} "+current_user.last_name
    @entertainment_representative_id = current_user.user_main_id
    @entertainment_division = current_user.division.name
    @entertainment_region = current_user.region.name
    password_length = 12
    @entertainment_parent_company.password = Devise.friendly_token.first(password_length)
    @function = ''
  end

  def edit

    @entertainment_parent_company = EntertainmentParentCompany.find(params[:id])
    @function = ''
  end

  def create
  	@entertainment_parent_company = EntertainmentParentCompany.new(entertainment_params)
  	if @entertainment_parent_company.save
        redirect_to new_entertainment_path, notice: 'Entertainment was successfully established.'
      else
        render :new
      end
  end

  private
  	def entertainment_params
      params.require(:entertainment_parent_company).permit(:corporate_email,:webpage_director_first_name,:webpage_director_skype_id,:region,:division,:representative_id,:representative_name,:url,:name,:sub_category,:function,:category,:icon,:email,:phone_number,:country,:state_or_province,:city,:street_address_1,:street_address_2,:postal_code,:contact_person_first_name,:contact_person_last_name,:url_picture,:parent_company_postal_code,:parent_company_street_address_2,:parent_company_street_address_1,:parent_company_city ,:parent_company_contact_person_salutation,:parent_company_state_or_province,:parent_company_contact_person_email_address,:parent_company_contact_person_last_name,:parent_company_country,:parent_company_contact_person_phone_number,:parent_company_contact_person_first_name,:parent_comapny_name,:webpage_director_phone_number,:webpage_director_email_address,:webpage_director_salutation,:webpage_director_last_name,:webpage_director_contact_person_first_name,:webpage_director_company,:password,:ee_user_id,:contact_person_position,:contact_person_phone,:contact_person_email,:contact_person_salutation, :from_datatable,entertainments_attributes: [:representative_id, :representative_name, :division, :region, :country, :url, :name, :category, :sub_category, :function, :icon, :email, :phone_number, :street_address_1, :street_address_2, :city, :state_or_province, :postal_code])
    end

end
