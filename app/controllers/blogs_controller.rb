class BlogsController < ApplicationController
	
	before_filter :load_blog, :only => [:edit,:update]
	
	access_control do
		allow all, :to => [:index,:show]
		allow logged_in, :to => [:new,:create]
		allow :admin, :to => [:destroy]
		allow :owner, :of => :blog, :to => [:edit,:update]
	end
	
	
  def index
    @blogs = Blog.find(:all)
  end
  
  def show
    @blog = Blog.find(params[:id])
		session[:blog] = @blog
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
			@blog.accepts_role! :owner, current_user
      flash[:notice] = "Successfully created blog."
      redirect_to @blog
    else
      render :action => 'new'
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:notice] = "Successfully updated blog."
      redirect_to @blog
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
		session[:blog] = nil
    flash[:notice] = "Successfully destroyed blog."
    redirect_to blogs_url
  end

	private
	
	def load_blog
		@blog = Blog.find(params[:id])
	end
end
