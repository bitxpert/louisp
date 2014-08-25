class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
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
	  	
end 