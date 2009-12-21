class DocumentsController < ApplicationController
  
	before_filter :load_document, :only => [:edit,:update]

	access_control do
		allow all, :to => [:index,:show]
		allow logged_in, :to => [:new,:create]
		allow :admin, :to => [:destroy]
		allow :owner, :of => :document, :to => [:edit,:update]
	end

	def index
    @documents = Document.find(:all)
  end
  
  def show
    @document = Document.find(params[:id])
  end
  
  def new
    @document = Document.new
		@document.user_id = current_user.id
  end
  
  def create
    @document = Document.new(params[:document])
    if @document.save
			@document.accepts_role! :owner, current_user
      flash[:notice] = "Successfully created document."
      redirect_to @document
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = "Successfully updated document."
      redirect_to @document
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = "Successfully destroyed document."
    redirect_to documents_url
  end

	private
	
	def load_document
		@document = Document.find(params[:id])
	end
end
