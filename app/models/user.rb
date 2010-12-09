require 'digest/sha1'
# a comment
class User < ActiveRecord::Base
	has_many :computer_allocations
	has_many :computers, :through => :computer_allocations
	has_many :software_allocations
	has_many :softwares, :through => :software_allocations
	belongs_to :office
	
	validates_presence_of			:name
	validates_uniqueness_of	:name
	
	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	validate :password_non_blank
	
	def password
		@password
	end
	
	def password=(pwd)
		@password = pwd
		return if pwd.blank?
		create_new_salt
		self.hashed_password = User.encrypted_password(self.password, self.salt)
	end
	
	def self.authenticate(name, password)
		user = self.find_by_name(name)
		if user
			expected_password = encrypted_password(password, user.salt)
			if user.hashed_password != expected_password
				user = nil
			end
		end
		user
	end
	
	def after_destroy
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

private
	def password_non_blank
		errors.add(:password, "Missing password") if hashed_password.blank?
	end
	
	def self.encrypted_password(password, salt)
		string_to_hash = password + "wibble" + salt
		Digest::SHA1.hexdigest(string_to_hash)
	end
	
	def create_new_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
end
