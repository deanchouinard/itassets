require 'spec_helper'

describe SitesController do
  render_views
  
  before(:each) do
    @site = Factory(:site)
    #     user = User.authenticate("Alex", "grey")
    # if user
    #   session[:user_id] = user.id
    # end
    @user = Factory(:user)
		session[:user_id] = 1
  end
  
  describe "GET 'index'" do
    
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @site
      response.should be_success
    end
  end
end
