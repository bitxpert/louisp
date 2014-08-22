class RegionsController < ApplicationController
	def new
		@region = Region.new
	end

	def create
		@region = Region.new(region_params)
		if @region.save
			redirect_to authenticated_root_url, notice: 'Region was successfully updated.' 
		end	
		
	end

	private
		def region_params
			params.require(:region).permit(:territory, :gdp_usd_billion, :population, :gdp_person_usd, :ee_score, :first_language, :second_language)
			
		end
end
