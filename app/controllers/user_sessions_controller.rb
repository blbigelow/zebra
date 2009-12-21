class UserSessionsController < ApplicationController
	
	access_control do
		allow anonymous, :to => [:new,:create]
		allow logged_in, :to => [:destroy]
		allow all, :to => [:index]
	end
	
	def index
		
	end
	
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to dashboards_url
    else
      redirect_to :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to :action => :index
  end
end
