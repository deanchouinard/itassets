class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
#      @office_items = current_user.office_list
      @office_items = current_user.offices
      @site_items = current_user.sites
      @company_items = current_user.companies
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
