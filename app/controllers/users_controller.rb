class UsersController < ApplicationController
	before_filter :load_user, :only => [:destroy]
	
	access_control do
		allow anonymous, :to => [:new,:create]
		allow :admin, :to => [:destroy]
		allow :owner, :of => :user, :to => [:destroy]
	end
	
  def new
		@user = User.new
  end

  def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "Registration successful!"
      redirect_back_or_default users_url
    else
      render :action => :new
		end
  end

  def edit
  end

  def show
  end

  def update
  end

	def destroy
	end
	
	private
	
	def load_user
		@user = User.find(params[:id])
	end

end
