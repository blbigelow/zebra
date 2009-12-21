class RepliesController < ApplicationController
  
	before_filter :load_reply, :only => [:edit,:update]
	
	access_control do
		allow all, :to => [:index,:show]
		allow logged_in, :to => [:new,:create]
		allow :admin, :to => [:destroy]
		allow :owner, :of => :reply, :to => [:edit,:update]
	end

	def index
    @replies = Reply.find(:all)
  end
  
  def show
    @reply = Reply.find(params[:id])
  end
  
  def new
    @reply = Reply.new
		@reply.user_id = current_user.id
  end
  
  def create
    @reply = Reply.new(params[:reply])
    if @reply.save
			@reply.accepts_role! :owner, current_user
      flash[:notice] = "Successfully created reply."
      redirect_to @reply
    else
      render :action => 'new'
    end
  end
  
  def edit
    @reply = Reply.find(params[:id])
  end
  
  def update
    @reply = Reply.find(params[:id])
    if @reply.update_attributes(params[:reply])
      flash[:notice] = "Successfully updated reply."
      redirect_to @reply
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    flash[:notice] = "Successfully destroyed reply."
    redirect_to replies_url
  end
	
	private
	
	def load_reply
		@reply = Reply.find(params[:id])
	end
end
