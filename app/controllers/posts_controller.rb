class PostsController < ApplicationController
	before_filter :load_post, :only => [:edit,:destroy]
	before_filter :load_blog, :only => [:new, :create]
	
	access_control do
		allow all, :to => [:index,:show]
		allow :owner, :of => :blog, :to => [:new,:create]
		allow :owner, :of => :post, :to => [:edit,:destroy]
	end
	
  def index
    @posts = Post.find(:all)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
		@post.user_id = current_user.id
		@post.blog_id = @blog.id
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
			@post.accepts_role! :owner, current_user
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end

	private
	
	def load_post
		@post = Post.find(params[:id])
	end
	
	def load_blog
		@blog = session[:blog]
		if !@blog
			redirect_to blogs_url
		end
	end
end
