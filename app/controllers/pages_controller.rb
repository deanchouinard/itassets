class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @office_items = current_user.office_list
      @site_items = current_user.site_list
      @company_items = current_user.company_list
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
