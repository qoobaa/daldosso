class CallStatus < ActiveRecord::Base
  has_many :calls
  validates_presence_of :name
end
