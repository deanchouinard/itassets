class SoftwareAllocationsController < ApplicationController
	before_filter :set_title
	before_filter :load_lookups, :only => [ :new, :edit ]

  # GET /software_allocations
  # GET /software_allocations.xml
  def index
    @software_allocations = SoftwareAllocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @software_allocations }
    end
  end

  # GET /software_allocations/1
  # GET /software_allocations/1.xml
  def show
    @software_allocation = SoftwareAllocation.find(params[:id])
    @software_user = User.display_str(@software_allocation.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @software_allocation }
    end
  end

  # GET /software_allocations/new
  # GET /software_allocations/new.xml
  def new
    @software_allocation = SoftwareAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @software_allocation }
    end
  end

  # GET /software_allocations/1/edit
  def edit
    @software_allocation = SoftwareAllocation.find(params[:id])
  end

  # POST /software_allocations
  # POST /software_allocations.xml
  def create
    @software_allocation = SoftwareAllocation.new(params[:software_allocation])

    respond_to do |format|
      if @software_allocation.save
        flash[:notice] = 'SoftwareAllocation was successfully created.'
        format.html { redirect_to(@software_allocation) }
        format.xml  { render :xml => @software_allocation, :status => :created, :location => @software_allocation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @software_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /software_allocations/1
  # PUT /software_allocations/1.xml
  def update
    @software_allocation = SoftwareAllocation.find(params[:id])

    respond_to do |format|
      if @software_allocation.update_attributes(params[:software_allocation])
        flash[:notice] = 'SoftwareAllocation was successfully updated.'
        format.html { redirect_to(@software_allocation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @software_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /software_allocations/1
  # DELETE /software_allocations/1.xml
  def destroy
    @software_allocation = SoftwareAllocation.find(params[:id])
    @software_allocation.destroy

    respond_to do |format|
      format.html { redirect_to(software_allocations_url) }
      format.xml  { head :ok }
    end
  end

	def set_title
		@page_title = "Software Allocations"
	end
	
	def load_lookups
		@software_list = Software.load_sel_list
		@user_list = User.load_sel_list
	end
	

end
