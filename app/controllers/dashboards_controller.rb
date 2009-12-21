class DashboardsController < ApplicationController
	
	access_control do
		allow logged_in, :to => [:index]
	end
	
  def index
		@user = current_user
	end
end
