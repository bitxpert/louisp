class PaintingsController < ApplicationController
	 before_filter :authenticate_user!
	def new
   		@painting = Painting.new
	end

	def create
		@painting = current_user.build_painting(product_params)
		if @painting.save
			redirect_to authenticated_root_url
		end
					
	end

	def update
		
		if current_user.painting.update(product_params)
			redirect_to authenticated_root_url
		end	
	end
		
	def show
		@painting = User.find(current_user.id).painting
	end

	def create_funny_image
		@painting = current_user.build_funny_image(product_params)
		if @painting.save
			redirect_to authenticated_root_url
		end
	
	end

	def update_funny_image
		if current_user.funny_image.update(product_params)
			redirect_to authenticated_root_url
		end
	end 

	private
	    def product_params
	      params.require(:painting).permit(:image)
	    end	
end
