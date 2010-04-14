class TicketActionsController < ApplicationController
  before_filter :set_title

  
  # GET /ticket_actions
  # GET /ticket_actions.xml
  def index
    @ticket_actions = TicketAction.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ticket_actions }
    end
  end

  # GET /ticket_actions/1
  # GET /ticket_actions/1.xml
  def show
    @ticket_action = TicketAction.find(params[:id])
    @ticket_display_str = Ticket.display_str(@ticket_action.ticket_id)
    @user_display_str = User.display_str(@ticket_action.add_user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket_action }
    end
  end

  # GET /ticket_actions/new
  # GET /ticket_actions/new.xml
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @ticket_action = @ticket.ticket_actions.build
    @ticket_display_str = Ticket.display_str(@ticket_action.ticket_id)
    @ticket_action.add_user_id = session[:user_id]
    @user_display_str = User.display_str(@ticket_action.add_user_id)

    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket_action }
    end
  end

  # ta_add
  # def ta_add
  #   @ticket_action = TicketAction.new
  #   logger.debug(params.to_yaml)
    
  #   respond_to do |format|
  #     format.html # ta_add.html.erb
  #     format.xml  { render :xml => @ticket_action }
  #   end
  # end

  # GET /ticket_actions/1/edit
  def edit
    @ticket_action = TicketAction.find(params[:id])
    @ticket_display_str = Ticket.display_str(@ticket_action.ticket_id)
    @user_display_str = User.display_str(@ticket_action.add_user_id)

  end

  # POST /ticket_actions
  # POST /ticket_actions.xml
  def create
    @ticket = Ticket.find(params[:ticket_action][:ticket_id])
#    logger.debug(@ticket.to_yaml)
    @ticket_action = @ticket.ticket_actions.build(params[:ticket_action])

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
