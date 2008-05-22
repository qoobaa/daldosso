class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :employee, :class_name => "User"
  belongs_to :order
end
