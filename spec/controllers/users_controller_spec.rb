require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'new'" do
       
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      visit '/users/new'
      page.should have_selector("title", text: "Sign Up")
#      page.should have_content("Sign Up")
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
#      get :show, :id => @user
      visit user_path(@user)
      page.should have_selector("title", :content => @user.name)
#      get :show, :id => @user
#      response.should have_selector("title", :content => @user.name)
    end
  end
  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => "" }
      end
      
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @attr
        Rails.logger.debug "HELLO==================================="
        Rails.logger.debug response.inspect
        response.body.should have_selector("title", :content => " Sign Up")
      end
      
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar"}
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~/welcome to it assets/i
      end
      
      it "should sign the user in" do
        post :create, :user  => @attr
        controller.should be_signed_in
      end
    end
  end
end


  