class Employee < ActiveRecord::Base
	has_and_belongs_to_many :roles
	has_many :calls
	has_many :orders
	has_many :events
end
