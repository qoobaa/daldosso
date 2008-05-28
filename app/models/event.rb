class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user
  belongs_to :order
  validates_presence_of :due_date, :added_date, :user, :order, :event_type
end
