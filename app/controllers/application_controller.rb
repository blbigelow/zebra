# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	rescue_from 'Acl9::AccessDenied', :with => :access_denied
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
	filter_parameter_logging :password, :password_confirmation
	helper_method :current_user_session, :current_user

  protected
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

	private
		def access_denied
			if current_user
				flash[:notice] = "User denied access. #{current_user.email}"
			  redirect_to :controller => :user_sessions, :action => :index
	    else
	      flash[:notice] = 'Access denied. Try to log in first.'
	      redirect_to :controller => :user_sessions, :action => :new
	    end
		end
end
