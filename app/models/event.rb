class Event < ActiveRecord::Base
	belongs_to :event_type
	belongs_to :employee
	belongs_to :order
end
