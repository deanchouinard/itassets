class TapesController < ApplicationController
	before_filter :set_title
	
	# GET /tapes
  # GET /tapes.xml
  def index
    @tapes = Tape.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tapes }
    end
  end

  # GET /tapes/1
  # GET /tapes/1.xml
  def show
    @tape = Tape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tape }
    end
  end

  # GET /tapes/new
  # GET /tapes/new.xml
  def new
    @tape = Tape.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tape }
    end
  end

  # GET /tapes/1/edit
  def edit
    @tape = Tape.find(params[:id])
  end

  # POST /tapes
  # POST /tapes.xml
  def create
    @tape = Tape.new(params[:tape])

    respond_to do |format|
      if @tape.save
        flash[:notice] = 'Tape was successfully created.'
        format.html { redirect_to(@tape) }
        format.xml  { render :xml => @tape, :status => :created, :location => @tape }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tapes/1
  # PUT /tapes/1.xml
  def update
    @tape = Tape.find(params[:id])

    respond_to do |format|
      if @tape.update_attributes(params[:tape])
        flash[:notice] = 'Tape was successfully updated.'
        format.html { redirect_to(@tape) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tapes/1
  # DELETE /tapes/1.xml
  def destroy
    @tape = Tape.find(params[:id])
    @tape.destroy

    respond_to do |format|
      format.html { redirect_to(tapes_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_title
		@page_title = "Tapes"
	end
end
