class TicketActionsController < ApplicationController
  before_filter :set_title
  
  # GET /ticket_actions
  # GET /ticket_actions.xml
  def index
    @ticket_actions = TicketAction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ticket_actions }
    end
  end

  # GET /ticket_actions/1
  # GET /ticket_actions/1.xml
  def show
    @ticket_action = TicketAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket_action }
    end
  end

  # GET /ticket_actions/new
  # GET /ticket_actions/new.xml
  def new
    @ticket_action = TicketAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket_action }
    end
  end

  # GET /ticket_actions/1/edit
  def edit
    @ticket_action = TicketAction.find(params[:id])
  end

  # POST /ticket_actions
  # POST /ticket_actions.xml
  def create
    @ticket_action = TicketAction.new(params[:ticket_action])

    respond_to do |format|
      if @ticket_action.save
        flash[:notice] = 'TicketAction was successfully created.'
        format.html { redirect_to(@ticket_action) }
        format.xml  { render :xml => @ticket_action, :status => :created, :location => @ticket_action }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_actions/1
  # PUT /ticket_actions/1.xml
  def update
    @ticket_action = TicketAction.find(params[:id])

    respond_to do |format|
      if @ticket_action.update_attributes(params[:ticket_action])
        flash[:notice] = 'TicketAction was successfully updated.'
        format.html { redirect_to(@ticket_action) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_actions/1
  # DELETE /ticket_actions/1.xml
  def destroy
    @ticket_action = TicketAction.find(params[:id])
    @ticket_action.destroy

    respond_to do |format|
      format.html { redirect_to(ticket_actions_url) }
      format.xml  { head :ok }
    end
  end

  private

  def set_title
    @page_title = "Ticket Actions"
  end
  
end
