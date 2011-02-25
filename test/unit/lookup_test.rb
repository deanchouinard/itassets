require 'test_helper'

class LookupTest < ActiveSupport::TestCase
  test "invalid with empty attributes" do
    lookup = Lookup.new
    assert !lookup.valid?
    assert lookup.errors.invalid?(:lu_key)
    assert lookup.errors.invalid?(:lu_value)
  end
  
  test "the truth" do
    assert true
  end
end
