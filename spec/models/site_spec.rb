require 'spec_helper'

describe Site do
  
  before(:each) do
    @attr = { :code => "BOS", :address1 => "20 State St", :city => "Boston",
              :state => "MA", :zipcode => "02789" }
  end
  
  it "should create a new instance give valid attributes" do
    Site.create!(@attr)
  end

end
