class AdminController < ApplicationController
  def login
		if request.post?
			user = User.authenticate(params[:name], params[:password])
			if user
				session[:user_id] = user.id
				redirect_to(:action => "index")
			else
				flash.now[:notice] = "Invalid user/password combination"
			end
		end
  end

  def logout
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to(:action => "login")
  end

  def index
		@user = User.find(session[:user_id])
    @user_display = "#{@user.first_name} #{@user.last_name} ( #{@user.name} )"

		# on the login, user is found, and we redirect to index; then we find the user again
		# and get the object so we can display his user name on the page.
  end

end
