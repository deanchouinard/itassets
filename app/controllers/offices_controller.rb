class OfficesController < ApplicationController
	before_filter :set_title
	before_filter :load_lookups, :only => [ :new, :edit ]
	
  # GET /offices
  # GET /offices.xml
  def index
    @offices = current_user.offices

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offices }
    end
  end

  # GET /offices/1
  # GET /offices/1.xml
  def show
    @office = Office.find(params[:id])
		# didn't need this if use belongs_to methods
		# @site_code = Site.find(@office.site_id)
		# @company_desc = Company.find(@office.company_id)
		
		@computer_items = @office.computers
		
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @office }
    end
  end

  # GET /offices/new
  # GET /offices/new.xml
  def new
    @office = Office.new
		
		
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @office }
    end
  end

  # GET /offices/1/edit
  def edit
    @office = Office.find(params[:id])
  end

  # POST /offices
  # POST /offices.xml
  def create
    @office = current_user.offices.build(params[:office])

    respond_to do |format|
      if @office.save
        flash[:notice] = 'Office was successfully created.'
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => @office, :status => :created, :location => @office }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @office.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offices/1
  # PUT /offices/1.xml
  def update
    @office = Office.find(params[:id])

    respond_to do |format|
      if @office.update_attributes(params[:office])
        flash[:notice] = 'Office was successfully updated.'
        format.html { redirect_to(@office) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @office.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.xml
  def destroy
    @office = Office.find(params[:id])
    @office.destroy

    respond_to do |format|
      format.html { redirect_to(offices_url) }
      format.xml  { head :ok }
    end
  end
	
	def set_title
		@page_title = "Offices"
	end
	
	def load_lookups
    # @sites = Site.all
    # @companies = Company.all
		# logger.debug @sites.to_yaml
    # @site_list = @sites.map {|si| [si.code, si.id]}
		# logger.debug @site_list.to_yaml
    
		@site_list = Site.load_sel_list( current_user.id )
		@company_list = Company.load_sel_list( current_user.id )
	end
	
end
