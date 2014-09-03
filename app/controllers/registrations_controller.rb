class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)
    @user_number = User.where(division_id: resource[:division_id],region_id: resource[:region_id]).order("region_user_number DESC").first
    
    if @user_number.present?
      resource[:region_user_number] = @user_number.region_user_number+1 
    else
      resource[:region_user_number] = 1 
    end
    @user_number_two_digits = sprintf '%02d', resource[:region_user_number] 
    @region_id_two_digits = sprintf '%02d', resource[:region_id]
    if resource[:role_id] ==  5                       #"Division Director"
      @is_DD = 1;
    else
      @is_DD = 0;  
    end
    resource[:user_main_id] = resource[:division_id].to_s+"#{@is_DD}"+@region_id_two_digits.to_s+@user_number_two_digits.to_s
    
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
  end

  def update
    super
  end

  def destroy
  	super
  end

  def edit
  	super
  end

  def subregion_options
  render partial: 'subregion_select'
	end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
	  	
end 