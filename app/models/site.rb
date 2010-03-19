class Site < ActiveRecord::Base
	has_many :offices
	has_many :companies, :through => :offices
end
