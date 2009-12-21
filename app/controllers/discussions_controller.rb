class DiscussionsController < ApplicationController
  
	before_filter :load_discussion, :only => [:edit,:update]

	access_control do
		allow all, :to => [:index,:show]
		allow logged_in, :to => [:new,:create]
		allow :admin, :to => [:destroy]
		allow :owner, :of => :discussion, :to => [:edit,:update]
	end

	def index
    @discussions = Discussion.find(:all)
  end
  
  def show
    @discussion = Discussion.find(params[:id])
  end
  
  def new
    @discussion = Discussion.new
		@discussion.user_id = current_user.id
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])
    if @discussion.save
			@discussion.accepts_role! :owner, current_user
      flash[:notice] = "Successfully created discussion."
      redirect_to @discussion
    else
      render :action => 'new'
    end
  end
  
  def edit
    @discussion = Discussion.find(params[:id])
  end
  
  def update
    @discussion = Discussion.find(params[:id])
    if @discussion.update_attributes(params[:discussion])
      flash[:notice] = "Successfully updated discussion."
      redirect_to @discussion
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    flash[:notice] = "Successfully destroyed discussion."
    redirect_to discussions_url
  end

	private
	
	def load_discussion
		@discussion = Discussion.find(params[:id])
	end
end
