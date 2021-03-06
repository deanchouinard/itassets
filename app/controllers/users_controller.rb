class UsersController < ApplicationController
#	before_filter :load_lookups, :only => [:new, :edit]
	
  def index
		@users = User.find(:all, :order => :name)
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name

    @offices = Office.where("user_id = ?", @user.id )

#    @offices = Office.find_all_by_user_id( @user.id )
    #@office_display_str = Office.display_str( @offices.id )
    
  end

  def new
    @title = "Sign Up"
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to IT Assets!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.name} was successfully updated."
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
		begin
			@user.destroy
			flash[:notice] = "User #{@user.name} deleted"
		rescue Exception => e
			flash[:notice] = e.message
		end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
	
	def load_lookups
    @office_list = Office.load_sel_list

  end
	
end
