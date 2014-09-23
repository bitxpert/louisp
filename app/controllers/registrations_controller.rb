class RegistrationsController < Devise::RegistrationsController
  before_filter :require_no_authentication, :only => :none
  before_filter :custome_auth
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    resource[:user_main_id] = 6000+User.order(id: :desc).limit(1).pluck(:id)[0]
    resource[:approved] = true
    resource[:role_id] = 3   #DAP
    resource[:referrer] = current_user.user_main_id
    resource[:division_id] = current_user.division.id
    resource[:region_id] = current_user.region.id
    
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :your_password if is_flashing_format?
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

  def custome_auth
    if current_user.role.name == "Data Acquisition Personnel"
      redirect_to authenticated_root_url, notice: "Umm Umm! you don't have access to this page"
    end
	end  	
end 