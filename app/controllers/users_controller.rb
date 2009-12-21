class UsersController < ApplicationController
	before_filter :load_user, :only => [:edit,:show]
	
	access_control do
		allow anonymous, :to => [:new,:create]
		allow :admin, :to => [:destroy]
		allow :owner, :of => :user, :to => [:edit,:show]
		allow all, :to => [:index]
	end
	
	def index
		
	end

	def show
		
  end
	
  def new
		@user = User.new
  end

  def create
		@user = User.new(params[:user])
		if @user.save
			@user.has_role! :owner, @user
			flash[:notice] = "Registration successful!"
      redirect_to :controller => :user_sessions, :action => :index
    else
      redirect_to :action => :new
		end
  end

  def edit
		
  end

  def update
  end

	def destroy
		user_to_remove = User.find(params[:id])
		user_to_remove.has_no_role! :owner, user_to_remove
		User.destroy(user_to_remove)
		flash[:notice] = "User Deleted!"
		redirect_to :controller => :user_sessions, :action => :index
	end
	
	private
	
	def load_user
		@user = User.find(params[:id])
	end

end
