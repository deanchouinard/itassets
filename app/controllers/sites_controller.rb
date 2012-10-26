class SitesController < ApplicationController
	before_filter :set_title

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def edit
    @site = Site.find(params[:id])
  end

  def create
    @site = current_user.sites.build(params[:site])
    @site.code.upcase!
    
    if @site.save
      flash[:notice] = 'Site was successfully created.'
      redirect_to(root_path)
    else
      render :action => "new"
    end
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      flash[:notice] = 'Site was successfully updated.'
      redirect_to(@site)
    else
      render :action => "edit"
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to(sites_url)
  end
	
	def set_title
		@page_title = "Sites"
	end
	
end
