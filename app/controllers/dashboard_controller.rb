class DashboardController < ApplicationController
	before_filter :authenticate_user!, only: [:show]
	
	def show
		@data = User.first.get_data
	end
end
