require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "invalid with empty attributes" do
    company = Company.new
    assert !company.valid?
    assert company.errors.invalid?(:code)
    assert company.errors.invalid?(:description)
  end
  
  test "unique company code" do
    company = Company.new( :code => companies(:aa).code,
                            :description => "dupe" )
    assert !company.save
    assert_equal "has already been taken", company.errors.on(:code)
    
  end
  
  test "the truth" do
    assert true
  end
end
