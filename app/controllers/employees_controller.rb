class EmployeesController < ApplicationController
	before_filter :set_title
	before_filter :load_lookups, :only => [ :new, :edit ]

end
