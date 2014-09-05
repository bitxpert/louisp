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
  end

  def edit
    @entertainment = current_user.entertainments.find(params[:id])
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
    puts "=================================="
    puts params.inspect
    puts "=================================="
    @entertainment = Entertainment.find(params[:id])
    respond_to do |format|
      if @entertainment.update(entertainment_params)
        format.html { redirect_to @entertainment, notice: 'Entertainment was successfully updated.' }
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

  def dumy_update
  end

  def initial_page
  end  

  private

    def entertainment_params
      params.require(:entertainment).permit(:corporate_email,:webpage_director_first_name,:webpage_director_skype_id,:region,:division,:representative_id,:representative_name,:url,:name,:sub_category,:function,:category,:icon,:email,:phone_number,:country,:state_or_province,:city,:street_address_1,:street_address_2,:postal_code,:contact_person_first_name,:contact_person_last_name,:url_picture,:parent_company_postal_code,:parent_company_street_address_2,:parent_company_street_address_1,:parent_company_city ,:parent_company_contact_person_salutation,:parent_company_state_or_province,:parent_company_contact_person_email_address,:parent_company_contact_person_last_name,:parent_company_country,:parent_company_contact_person_phone_number,:parent_company_contact_person_first_name,:parent_comapny_name,:webpage_director_phone_number,:webpage_director_email_address,:webpage_director_salutation,:webpage_director_last_name,:webpage_director_contact_person_first_name,:webpage_director_company,:password,:user_id,:contact_person_position,:contact_person_phone,:contact_person_email,:contact_person_salutation, :from_datatable)
    end
end
