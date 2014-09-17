class EntertainmentsController < ApplicationController
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
   @entertainment = Entertainment.new
    @entertainment.representative_name = current_user.first_name+" #{current_user.middle_name} "+current_user.last_name
    @entertainment.representative_id = current_user.user_main_id
    @entertainment.division = current_user.division.name
    @entertainment.region = current_user.region.name
    password_length = 12
    @entertainment.password = Devise.friendly_token.first(password_length)
    @entertainment.ee_user_id = Entertainment.order("id desc").first.id
    @function = ''    
  end

  def edit

    @entertainment = Entertainment.find(params[:id])
    @entertainment_parent_company =  EntertainmentParentCompany.find(@entertainment.ee_user_id)

     @entertainment.parent_company_postal_code = @entertainment_parent_company.parent_company_postal_code
      @entertainment.parent_company_street_address_2 = @entertainment_parent_company.parent_company_street_address_2
      @entertainment.parent_company_street_address_1 = @entertainment_parent_company.parent_company_street_address_1
      @entertainment.parent_company_city  = @entertainment_parent_company.parent_company_city 
      @entertainment.parent_company_contact_person_salutation = @entertainment_parent_company.parent_company_contact_person_salutation
      @entertainment.parent_company_state_or_province = @entertainment_parent_company.parent_company_state_or_province
      @entertainment.parent_company_contact_person_email_address = @entertainment_parent_company.parent_company_contact_person_email_address
      @entertainment.parent_company_contact_person_last_name = @entertainment_parent_company.parent_company_contact_person_last_name
      @entertainment.parent_company_country = @entertainment_parent_company.parent_company_country
      @entertainment.parent_company_contact_person_phone_number = @entertainment_parent_company.parent_company_contact_person_phone_number
      @entertainment.parent_company_contact_person_first_name = @entertainment_parent_company.parent_company_contact_person_first_name
      @entertainment.parent_comapny_name  = @entertainment_parent_company.parent_comapny_name 
      @entertainment.webpage_director_phone_number = @entertainment_parent_company.webpage_director_phone_number
      @entertainment.webpage_director_email_address = @entertainment_parent_company.webpage_director_email_address
      @entertainment.webpage_director_salutation = @entertainment_parent_company.webpage_director_salutation
      @entertainment.webpage_director_last_name = @entertainment_parent_company.webpage_director_last_name
      @entertainment.webpage_director_contact_person_first_name = @entertainment_parent_company.webpage_director_contact_person_first_name
      @entertainment.webpage_director_company = @entertainment_parent_company.webpage_director_company
      @entertainment.webpage_director_first_name = @entertainment_parent_company.webpage_director_first_name
      @entertainment.webpage_director_skype_id = @entertainment_parent_company.webpage_director_skype_id
      @entertainment.password = @entertainment_parent_company.password
      @entertainment.parent_company_contact_person_skype_id = @entertainment_parent_company.parent_company_contact_person_skype_id
    @function = @entertainment.function
  end

  def create
    @entertainment = current_user.entertainments.build(entertainment_params)

    respond_to do |format|
      if @entertainment.save
        format.html { redirect_to new_entertainment_path, notice: 'Entertainment was successfully established.' }
        format.json { render :show, status: :created, location: @entertainment }
      else
        format.html { render :new }
        format.json { render json: @entertainment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @entertainment = Entertainment.find(params[:id])
    @entertainment_parent_company = EntertainmentParentCompany.find(@entertainment.ee_user_id)
    
    respond_to do |format|
      if @entertainment.update(entertainment_params) and @entertainment_parent_company.update(entertainment_parent_company_params) 
        format.html { redirect_to entertainments_path, notice: 'Entertainment was successfully updated.' }
        format.json { render :show, status: :ok, location: @entertainment }
      else
        format.html { render :edit }
        format.json { render json: @entertainment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entertainment = current_user.entertainments.find(params[:id])
    @entertainment.destroy
    respond_to do |format|
      format.html { redirect_to entertainments_url, notice: 'Entertainment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report
    if current_user.role.present?
      if current_user.role.name == "Senior Director"
        @entertainments = Entertainment.all.order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      else
        @entertainments = Entertainment.where(region: current_user.region.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")  
      end
    else
      @entertainments = Entertainment.where(region: current_user.region.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
    end
  end

  def report_by_function
    @count = {}
    if current_user.role.present?
      if current_user.role.name == "Senior Director"
        @entertainments = Entertainment.all.order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.uniq.pluck(:function)
        @by.each do |function|
          @count[function] = Entertainment.where(function: function).count
        end
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(division: current_user.division.name).order("function asc").uniq.pluck(:function)
        @by.each do |function|
          @count[function] = Entertainment.where(function: function, division: current_user.division.name).count 
        end
      else
        @entertainments = Entertainment.where(region: current_user.region.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(region: current_user.region.name).order("function asc").uniq.pluck(:function)  
        @by.each do |function|
          @count[function] = Entertainment.where(function: function, region: current_user.region.name).count 
        end
      end
    else
      @entertainments = Entertainment.where(region: current_user.region.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      @by = Entertainment.where(region: current_user.region.name).order("function asc").uniq.pluck(:function)
      @by.each do |function|
          @count[function] = Entertainment.where(function: function, region: current_user.region.name).count 
      end
    end
  end

  def report_by_country
    @count = {}
    if current_user.role.present?
      if current_user.role.name == "Senior Director"
        @entertainments = Entertainment.all.order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.uniq.pluck(:country)
        @by.each do |country|
          @count[country] = Entertainment.where(country: country).count
        end
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(division: current_user.division.name).order("country asc").uniq.pluck(:country)
        @by.each do |country|
          @count[country] = Entertainment.where(country: country, division: current_user.division.name).count 
        end
      else
        @entertainments = Entertainment.where(region: current_user.region.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")  
        @by = Entertainment.where(region: current_user.region.name).order("country asc").uniq.pluck(:country)
        @by.each do |country|
          @count[country] = Entertainment.where(country: country, region: current_user.region.name).count 
        end
      end
    else
      @entertainments = Entertainment.where(region: current_user.region.name).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      @by = Entertainment.where(region: current_user.region.name).order("country asc").uniq.pluck(:country)
      @by.each do |country|
          @count[country] = Entertainment.where(country: country, region: current_user.region.name).count 
      end
    end
  end

  def dumy_update
  end

  def initial_page
  end  

  private

    def entertainment_parent_company_params
      params.require(:entertainment).permit(:webpage_director_first_name,:webpage_director_skype_id,:contact_person_first_name,:contact_person_last_name,:url_picture,:parent_company_postal_code,:parent_company_street_address_2,:parent_company_street_address_1,:parent_company_city ,:parent_company_contact_person_salutation,:parent_company_state_or_province,:parent_company_contact_person_email_address,:parent_company_contact_person_last_name,:parent_company_country,:parent_company_contact_person_phone_number,:parent_company_contact_person_first_name,:parent_comapny_name,:webpage_director_phone_number,:webpage_director_email_address,:webpage_director_salutation,:webpage_director_last_name,:webpage_director_contact_person_first_name,:webpage_director_company,:password,:ee_user_id,:contact_person_position,:contact_person_phone,:contact_person_email,:contact_person_salutation, :from_datatable)
    end

    def entertainment_params
      params.require(:entertainment).permit(:corporate_email,:webpage_director_first_name,:webpage_director_skype_id,:region,:division,:representative_id,:representative_name,:url,:name,:sub_category,:function,:category,:icon,:email,:phone_number,:country,:state_or_province,:city,:street_address_1,:street_address_2,:postal_code,:contact_person_first_name,:contact_person_last_name,:url_picture,:parent_company_postal_code,:parent_company_street_address_2,:parent_company_street_address_1,:parent_company_city ,:parent_company_contact_person_salutation,:parent_company_state_or_province,:parent_company_contact_person_email_address,:parent_company_contact_person_last_name,:parent_company_country,:parent_company_contact_person_phone_number,:parent_company_contact_person_first_name,:parent_comapny_name,:webpage_director_phone_number,:webpage_director_email_address,:webpage_director_salutation,:webpage_director_last_name,:webpage_director_contact_person_first_name,:webpage_director_company,:password,:ee_user_id,:contact_person_position,:contact_person_phone,:contact_person_email,:contact_person_salutation, :from_datatable)
    end
    

end
