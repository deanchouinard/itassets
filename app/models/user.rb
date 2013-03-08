# == Schema Information
# Schema version: 20101209190403
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean
#  first_name      :string(40)
#  last_name       :string(40)
#  email           :string(40)
#  office_id       :integer         not null
#

require 'digest'

class User < ActiveRecord::Base
	has_many :computer_allocations
	has_many :computers, :through => :computer_allocations
	has_many :software_allocations
	has_many :softwares, :through => :software_allocations
	has_many :offices
	has_many :sites
	has_many :companies
	has_many :employees
	
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email, :presence => true,
	                  :format => { :with => email_regex },
	                  :uniqueness => { :case_sensitive => false }
	                      
	validates	:name,  :presence => true,
	                  :uniqueness => true
	                  
	validates :password, :presence => true,
	                      :confirmation => true,
	                      :length => { :within => 6..40 }

	before_save :encrypt_password
	
	def has_password?(submitted_password)
	 encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
	 user = find_by_id(id)
	 (user && user.salt == cookie_salt) ? user : nil
	end
	
	# 6/10/11 change to self because of warnings that Base#after_destroy has
	# been depreciated during spec tests
	def self.after_destroy
		if User.count.zero?
			raise "Can't delete last user"
		end
	end
	
	def self.load_sel_list
		self.find(:all).map {|us| ["#{us.first_name} #{us.last_name} (#{ us.name})", us.id]}
	end

	def self.display_str(id)
		user = self.find(id)
    "#{user.first_name} #{user.last_name} (#{ user.name})"
	end

 # def office_list
#    offices
#  end
  
#  def site_list
#    sites
#  end
  
#  def company_list
#    companies
#  end
private
  
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
