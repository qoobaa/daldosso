class Call < ActiveRecord::Base
	belongs_to :call_status
	belongs_to :order
	belongs_to :employee
	belongs_to :customer
end
