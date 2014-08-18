class PaintingsController < ApplicationController
	def new
   	@painting = Painting.new
	end

	def create
		@painting = Painting.new(product_params)
		if @painting.save
		render :show
		end	
	end

	def show
		@painting = Painting.last
	end 
	private
	    def product_params
	      params.require(:painting).permit(:image)
	    end	
end
