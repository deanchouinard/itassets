# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  first_name :string(40)
#  last_name  :string(40)
#  title      :string(40)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Employee < ActiveRecord::Base

	belongs_to :user
	
	validates_presence_of :first_name, :last_name

end
