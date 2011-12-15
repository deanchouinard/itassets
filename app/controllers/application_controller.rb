class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
#	before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
#    protect_from_forgery # See ActionController::RequestForgeryProtection for details

    # Scrub sensitive parameters from your log
    # filter_parameter_logging :password

protected
	def authorize
		unless User.find_by_id(session[:user_id])
			flash[:notice] = "Please log in"
			redirect_to :controller => 'admin', :action => 'login'
		end
	end
end
