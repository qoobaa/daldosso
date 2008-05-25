class Call < ActiveRecord::Base
  belongs_to :call_status
  belongs_to :order
  validates_presence_of :order, :call_status, :description
end
