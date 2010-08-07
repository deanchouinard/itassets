class TapeMovesController < ApplicationController
	before_filter :set_title
	before_filter :load_lookups, :only => [ :new, :edit ]
	
	# GET /tape_moves
  # GET /tape_moves.xml
  def index
    @tape_moves = TapeMove.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tape_moves }
    end
  end

  # GET /tape_moves/1
  # GET /tape_moves/1.xml
  def show
    @tape_move = TapeMove.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tape_move }
    end
  end

  # GET /tape_moves/new
  # GET /tape_moves/new.xml
  def new
    @tape_move = TapeMove.new
    logger.debug("hello")
    logger.debug(params.to_yaml)
    @tape = Tape.find(params[:tape_id])
    @tape_move.tape_id = @tape.id
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tape_move }
    end
  end

  # GET /tape_moves/1/edit
  def edit
    @tape_move = TapeMove.find(params[:id])
  end

  # POST /tape_moves
  # POST /tape_moves.xml
  def create
    @tape_move = TapeMove.new(params[:tape_move])

    respond_to do |format|
      if @tape_move.save
        flash[:notice] = 'TapeMove was successfully created.'
        format.html { redirect_to(@tape_move) }
        format.xml  { render :xml => @tape_move, :status => :created, :location => @tape_move }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tape_move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tape_moves/1
  # PUT /tape_moves/1.xml
  def update
    @tape_move = TapeMove.find(params[:id])

    respond_to do |format|
      if @tape_move.update_attributes(params[:tape_move])
        flash[:notice] = 'TapeMove was successfully updated.'
        format.html { redirect_to(@tape_move) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tape_move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tape_moves/1
  # DELETE /tape_moves/1.xml
  def destroy
    @tape_move = TapeMove.find(params[:id])
    @tape_move.destroy

    respond_to do |format|
      format.html { redirect_to(tape_moves_url) }
      format.xml  { head :ok }
    end
  end

  def set_title
		@page_title = "Tape Moves"
	end
	
	def load_lookups
		@tape_list = Tape.load_sel_list
		@tape_dest_list = Lookup.get_lu_values("TAPEDEST")
	end
	
end
