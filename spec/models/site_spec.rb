# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  code       :string(8)
#  address1   :string(80)
#  address2   :string(80)
#  city       :string(30)
#  state      :string(2)
#  zipcode    :string(10)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'spec_helper'

describe Site do
  
  before(:each) do
    @attr = { :code => "BOS", :address1 => "20 State St", :city => "Boston",
              :state => "MA", :zipcode => "02789" }
  end
  
  it "should create a new instance give valid attributes" do
    Site.create!(@attr)
  end
  
  it "should require a code" do
    no_code_site = Site.new(@attr.merge(:code  => ""))
    no_code_site.should_not be_valid
  end
  
  it "should reject codes that are too long" do
    long_code = "a" * 10
    long_code_site = Site.new(@attr.merge(:code => long_code))
    long_code_site.should_not be_valid
  end
  
  it "should reject duplicate codes" do
    Site.create!(@attr)
    duplicate_site = Site.new(@attr)
    duplicate_site.should_not be_valid
  end

end
