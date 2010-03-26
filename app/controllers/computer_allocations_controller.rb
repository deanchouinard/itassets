class ComputerAllocationsController < ApplicationController
	before_filter :set_title
	before_filter :load_lookups, :only => [ :new, :edit ]
	
  # GET /computer_allocations
  # GET /computer_allocations.xml
  def index
    @computer_allocations = ComputerAllocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @computer_allocations }
    end
  end

  # GET /computer_allocations/1
  # GET /computer_allocations/1.xml
  def show
    @computer_allocation = ComputerAllocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @computer_allocation }
    end
  end

  # GET /computer_allocations/new
  # GET /computer_allocations/new.xml
  def new
    @computer_allocation = ComputerAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @computer_allocation }
    end
  end

  # GET /computer_allocations/1/edit
  def edit
    @computer_allocation = ComputerAllocation.find(params[:id])
  end

  # POST /computer_allocations
  # POST /computer_allocations.xml
  def create
    @computer_allocation = ComputerAllocation.new(params[:computer_allocation])

    respond_to do |format|
      if @computer_allocation.save
        flash[:notice] = 'ComputerAllocation was successfully created.'
        format.html { redirect_to(@computer_allocation) }
        format.xml  { render :xml => @computer_allocation, :status => :created, :location => @computer_allocation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @computer_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /computer_allocations/1
  # PUT /computer_allocations/1.xml
  def update
    @computer_allocation = ComputerAllocation.find(params[:id])

    respond_to do |format|
      if @computer_allocation.update_attributes(params[:computer_allocation])
        flash[:notice] = 'ComputerAllocation was successfully updated.'
        format.html { redirect_to(@computer_allocation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @computer_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /computer_allocations/1
  # DELETE /computer_allocations/1.xml
  def destroy
    @computer_allocation = ComputerAllocation.find(params[:id])
    @computer_allocation.destroy

    respond_to do |format|
      format.html { redirect_to(computer_allocations_url) }
      format.xml  { head :ok }
    end
  end
	
	def set_title
		@page_title = "Computer Allocations"
	end
	
	def load_lookups
		@computer_list = Computer.load_sel_list
		
		@user_list = User.load_sel_list
	end
end
