require 'spec_helper'

describe "LayoutLinks" do
    
    subject { page }
    
    it "should have a Home page at '/'" do
      visit '/'
      should have_selector('title', :content => "Home")
    end

    it "should have a Contact page at '/contact'" do
      visit '/contact'
      should have_selector('title', :content => "Contact")
    end

    it "should have a About page at '/about'" do
      visit '/about'
      should have_selector('title', :content => "About")
    end

    it "should have a Help page at '/help'" do
      visit '/help'
      should have_selector('title', :content => "Help")
    end

    it "should have a signup page at '/signup'" do
      visit '/signup'
      should have_selector('title', :content => "Sign Up")
    end

    it "should have a signin page at '/signin'" do
      visit '/signin'
      should have_selector('title', :content => "Sign In")
    end

    # it "should have a signout page at '/signout'" do
    #   get '/signout'
    #   response.should have_selector('title', :content => "Home")
    # end

    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      should have_selector('title', :content => "About")
      click_link "Help"
      should have_selector('title', :content => "Help")
      click_link "Contact"
      should have_selector('title', :content => "Contact")
      click_link "Home"
      should have_selector('title', :content => "Home")
      click_link "Sign up now!"
      should have_selector('title', :content => "Sign Up")
      should have_selector('a[href="/"]>img')
      
    end
    
    describe "when not signed in" do
      it "should have a  signin link" do
        visit root_path
        should have_selector("a", :href => signin_path,
                                            :content => "Sign in")
      end
    end
    
    describe "when signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        integration_sign_in @user
      end
      
      it "should have a signout link" do
        visit root_path
        should have_selector("a",  :href => signout_path,
                                            :content => "Sign out")
      end
      
      it "should have a profile link" do
        visit root_path
        should have_selector("a",  :href => user_path(@user),
                                            :content => "Profile")
      end

      it "should have a settings link" do
        visit root_path
        should have_selector("a",  :href => edit_user_path(@user),
                                            :content => "Settings")
      end

      it "should have a users link" do
        visit root_path
        should have_selector("a",  :href => users_path,
                                            :content => "Users")
      end

    end
  
end
