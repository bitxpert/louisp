class RegistrationsController < Devise::RegistrationsController
  before_filter :require_no_authentication, :only => :none
  before_filter :custome_auth,  only: [ :new, :create ]
  def new
    @My_daps = User.where(referrer: current_user.user_main_id)
    super
  end

  def create
    puts "============================================"
    puts params.inspect
    puts "============================================"
    build_resource(sign_up_params)

    

    resource[:user_main_id] = 2000+User.order(id: :desc).limit(1).pluck(:id)[0]
    resource[:approved] = true
    resource[:role_id] = 3   #DAP
    resource[:referrer] = current_user.user_main_id
    resource[:division_id] = current_user.division.id
    resource[:region_id] = current_user.region.id
    resource[:password_clone] = resource_params[:password]
    
    puts "============================================"
    puts resource.inspect
    puts "============================================"

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :your_password if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: new_user_registration_path
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
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource[:password_clone] = resource_params[:password]
    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
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

   protected

  def sign_up(resource_name, resource)
    true
  end  	
end 