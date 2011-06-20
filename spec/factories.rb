
Factory.define :site do |site|
  site.code     "BOS"
  site.address1 "20 State St"
  site.city     "Boston"
  site.state    "MA"
  site.zipcode  "02345"
end

Factory.define :user do |user|
  user.name  "Alex"
  user.id 1
  user.password "grey01"
  user.email "alex@test.com"
  user.office_id 1
end