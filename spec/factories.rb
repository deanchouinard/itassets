
FactoryGirl.define do
  factory :site do
    code     "BOS"
    address1 "20 State St"
    city     "Boston"
    state    "MA"
    zipcode  "02345"
  end
  
  factory :user do
    name  "Alex"
    id 1
    password "grey01"
    email "alex@test.com"
    office_id 1
  end
end
