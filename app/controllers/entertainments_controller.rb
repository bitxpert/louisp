class EntertainmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :custome_auth,  only: [ :edit, :update, :index, :dap_entertainmentsm, :edit_dap, :update_dap ]
  before_filter :current_user_to_model

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
    @entertainment.representative_name = current_user.try(:first_name)+" #{current_user.try(:middle_name)} "+current_user.try(:last_name)
    @entertainment.representative_id = current_user.try(:user_main_id)
    @entertainment.division = current_user.try(:division).try(:name)
    @entertainment.region = current_user.try(:region).try(:name)
    password_length = 12
    @entertainment.password = Devise.friendly_token.first(password_length)
    @entertainment.ee_user_id = Entertainment.order("id desc").first.id
    @function = ''    
  end

  def edit
    @entertainment = Entertainment.find(params[:id])
    if(@entertainment.entertainment_parent_company.nil?)
      password_length = 12
      @password = Devise.friendly_token.first(password_length)
      @entertainment.ee_user_id = EntertainmentParentCompany.create(password: @password).id
      @entertainment.save(:validate => false)
    end  
    redirect_to edit_entertainment_parent_company_path
    
    


    @entertainment_parent_company =  EntertainmentParentCompany.find(@entertainment.ee_user_id)

    #  @entertainment.parent_company_postal_code = @entertainment_parent_company.parent_company_postal_code
    #   @entertainment.parent_company_street_address_2 = @entertainment_parent_company.parent_company_street_address_2
    #   @entertainment.parent_company_street_address_1 = @entertainment_parent_company.parent_company_street_address_1
    #   @entertainment.parent_company_city  = @entertainment_parent_company.parent_company_city 
    #   @entertainment.parent_company_contact_person_salutation = @entertainment_parent_company.parent_company_contact_person_salutation
    #   @entertainment.parent_company_state_or_province = @entertainment_parent_company.parent_company_state_or_province
    #   @entertainment.parent_company_contact_person_email_address = @entertainment_parent_company.parent_company_contact_person_email_address
    #   @entertainment.parent_company_contact_person_last_name = @entertainment_parent_company.parent_company_contact_person_last_name
    #   @entertainment.parent_company_country = @entertainment_parent_company.parent_company_country
    #   @entertainment.parent_company_contact_person_phone_number = @entertainment_parent_company.parent_company_contact_person_phone_number
    #   @entertainment.parent_company_contact_person_first_name = @entertainment_parent_company.parent_company_contact_person_first_name
    #   @entertainment.parent_comapny_name  = @entertainment_parent_company.parent_comapny_name 
    #   @entertainment.webpage_director_phone_number = @entertainment_parent_company.webpage_director_phone_number
    #   @entertainment.webpage_director_email_address = @entertainment_parent_company.webpage_director_email_address
    #   @entertainment.webpage_director_salutation = @entertainment_parent_company.webpage_director_salutation
    #   @entertainment.webpage_director_last_name = @entertainment_parent_company.webpage_director_last_name
    #   @entertainment.webpage_director_contact_person_first_name = @entertainment_parent_company.webpage_director_contact_person_first_name
    #   @entertainment.webpage_director_company = @entertainment_parent_company.webpage_director_company
    #   @entertainment.webpage_director_first_name = @entertainment_parent_company.webpage_director_first_name
    #   @entertainment.webpage_director_skype_id = @entertainment_parent_company.webpage_director_skype_id
    #   @entertainment.password = @entertainment_parent_company.password
    #   @entertainment.parent_company_contact_person_skype_id = @entertainment_parent_company.parent_company_contact_person_skype_id
    # @function = @entertainment.function
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
        @entertainments = Entertainment.all.limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      else
        @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")  
      end
    else
      @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
    end
  end

  def report_by_function
    @count = {}
    if current_user.role.present?
      if current_user.role.name == "Senior Director"
        @entertainments = Entertainment.all.limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.uniq.pluck(:function)
        @by.each do |function|
          @count[function] = Entertainment.where(function: function).count
        end
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(division: current_user.division.name).order("function asc").uniq.pluck(:function)
        @by.each do |function|
          @count[function] = Entertainment.where(function: function, division: current_user.division.name).count 
        end
      else
        @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(0).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(region: current_user.region.name).order("function asc").uniq.pluck(:function)  
        @by.each do |function|
          @count[function] = Entertainment.where(function: function, region: current_user.region.name).count 
        end
      end
    else
      @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(3).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
      @by = Entertainment.where(region: current_user.region.name).order("function asc").uniq.pluck(:function)
      @by.each do |function|
          @count[function] = Entertainment.where(function: function, region: current_user.region.name).count 
      end
    end
  end

  def function_rep
    if current_user.role.name == "Senior Director"
      @entertainments = Entertainment.all.limit(100).offset(params[:offset]).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
    elsif current_user.role.name == "Divisional Director"
      @entertainments = Entertainment.where(division: current_user.division.name).limit(100).offset(params[:offset]).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
    else
      @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(params[:offset]).order("function desc").order("category desc").order("country asc").order("state_or_province asc").order("name asc")
    end
    
    respond_to do |format|
    format.html
    format.json do 
      @entertainments.each do |e|
        e.country = Carmen::Country.coded(e.country).name
      end
      render json: @entertainments
    end
    end
  end

  def report_by_country
    @count = {}
    if current_user.role.present?
      if current_user.role.name == "Senior Director"
        @entertainments = Entertainment.all.limit(100).offset(0).order("country desc").order("category desc").order("function asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.uniq.pluck(:country)
        @by.each do |country|
          @count[country] = Entertainment.where(country: country).count
        end
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).limit(100).offset(0).order("country desc").order("category desc").order("function asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(division: current_user.division.name).order("country asc").uniq.pluck(:country)
        @by.each do |country|
          @count[country] = Entertainment.where(country: country, division: current_user.division.name).count 
        end
      else
        @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(0).order("country desc").order("category desc").order("function asc").order("state_or_province asc").order("name asc")  
        @by = Entertainment.where(region: current_user.region.name).order("country asc").uniq.pluck(:country)
        @by.each do |country|
          @count[country] = Entertainment.where(country: country, region: current_user.region.name).count 
        end
      end
    else
      @entertainments = Entertainment.where(region: current_user.region.name).limit(100).offset(0).order("country desc").order("category desc").order("function asc").order("state_or_province asc").order("name asc")
      @by = Entertainment.where(region: current_user.region.name).order("country asc").uniq.pluck(:country)
      @by.each do |country|
          @count[country] = Entertainment.where(country: country, region: current_user.region.name).count 
      end
    end
  end
#[68, 57, 58, 51, 70, 66, 55, 62, 73, 69, 59, 53, 63, 67, 71, 72, 60, 64, 61, 54, 76, 77, 56, nil]


#Entertainment.where(user_id: 56).update_all(representative_id: User.find(56).user_main_id)

  def report_by_rep
    @count = {}
    if current_user.role.present?
      if current_user.role.name == "Senior Director"
        @entertainments = Entertainment.all.limit(100).offset(0).order("representative_id desc").order("category desc").order("function asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.uniq.pluck(:representative_id)
        @by.shift
        @by.each do |representative_id|
          @count[representative_id] = Entertainment.where(representative_id: representative_id).count
        end
      elsif current_user.role.name == "Divisional Director"
        @entertainments = Entertainment.where(division: current_user.division.name).limit(100).offset(0).order("representative_id desc").order("category desc").order("function asc").order("state_or_province asc").order("name asc")
        @by = Entertainment.where(division: current_user.division.name).order("representative_id asc").uniq.pluck(:representative_id)
        @by.each do |representative_id|
          @count[representative_id] = Entertainment.where(representative_id: representative_id, division: current_user.division.name).count 
        end
      end
     end 
  end

  def dumy_update
  end

  def initial_page
  end 

  def custome_auth
    if current_user.role.name == "Data Acquisition Personnel"
      redirect_to authenticated_root_url, notice: "Umm Umm! you don't have access to this page"
    end
  end 

  def current_user_to_model
    @current_user_role = current_user.try(:role).try(:name)
  end

  def dap_entertainments
    respond_to do |format|
    format.html
    format.json { render json: ::EntertainmentsDapDatatable.new(view_context) }
    end
  end

  def edit_dap
      @entertainment = Entertainment.find(params[:id])
      if @entertainment.user.role.name == 'Data Acquisition Personnel'
      else
         redirect_to authenticated_root_url, notice: "Umm Umm! you don't have access to this page" 
      end  

  end

  def update_dap
    @entertainment = Entertainment.find(params[:id])
    
    respond_to do |format|
      if @entertainment.update(entertainment_params) 
        format.html { redirect_to entertainments_path, notice: 'Entertainment was successfully updated.' }
        format.json { render :show, status: :ok, location: @entertainment }
      else
        format.html { render :edit }
        format.json { render json: @entertainment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def entertainment_parent_company_params
      params.require(:entertainment).permit(:webpage_director_first_name,:webpage_director_skype_id,:contact_person_first_name,:contact_person_last_name,:url_picture,:parent_company_postal_code,:parent_company_street_address_2,:parent_company_street_address_1,:parent_company_city ,:parent_company_contact_person_salutation,:parent_company_state_or_province,:parent_company_contact_person_email_address,:parent_company_contact_person_last_name,:parent_company_country,:parent_company_contact_person_phone_number,:parent_company_contact_person_first_name,:parent_comapny_name,:webpage_director_phone_number,:webpage_director_email_address,:webpage_director_salutation,:webpage_director_last_name,:webpage_director_contact_person_first_name,:webpage_director_company,:password,:ee_user_id,:contact_person_position,:contact_person_phone,:contact_person_email,:contact_person_salutation, :from_datatable)
    end

    def entertainment_params
      params.require(:entertainment).permit(:corporate_email,:webpage_director_first_name,:webpage_director_skype_id,:region,:division,:representative_id,:representative_name,:url,:name,:sub_category,:function,:category,:icon,:email,:phone_number,:country,:state_or_province,:city,:street_address_1,:street_address_2,:postal_code,:contact_person_first_name,:contact_person_last_name,:url_picture,:parent_company_postal_code,:parent_company_street_address_2,:parent_company_street_address_1,:parent_company_city ,:parent_company_contact_person_salutation,:parent_company_state_or_province,:parent_company_contact_person_email_address,:parent_company_contact_person_last_name,:parent_company_country,:parent_company_contact_person_phone_number,:parent_company_contact_person_first_name,:parent_comapny_name,:webpage_director_phone_number,:webpage_director_email_address,:webpage_director_salutation,:webpage_director_last_name,:webpage_director_contact_person_first_name,:webpage_director_company,:password,:ee_user_id,:contact_person_position,:contact_person_phone,:contact_person_email,:contact_person_salutation, :from_datatable)
    end
    

end
