class SelectBlogController < ApplicationController
  #before_filter :load_blog, :only => [:edit,:update]
	
	access_control do
		allow logged_in, :to => [:show,:update]
	end

	def show
		@blogs = current_user.blogs
  end

  def update
		@blog = Blog.find(params[:blog])
    if @blog
			session[:blog] = @blog
      flash[:notice] = "Successfully selected blog."
      redirect_to :controller => 'posts', :action => 'new'
    else
      render :action => 'show'
    end
  end

end
