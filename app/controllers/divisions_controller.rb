class DivisionsController < ApplicationController
	def new
		@division = Division.new
	end

	def create
		@division = Division.new(division_params)
		if @division.save
			redirect_to authenticated_root_url, notice: 'Division was successfully updated.' 
		end	
		
	end

	private
		def division_params
			params.require(:division).permit(:name)
		end
end
