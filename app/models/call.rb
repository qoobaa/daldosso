class Call < ActiveRecord::Base
  belongs_to :call_status
  belongs_to :order
  belongs_to :employee, :class_name => "User"
  belongs_to :customer, :class_name => "User"
end
