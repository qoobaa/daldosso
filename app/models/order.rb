class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :order_status
  belongs_to :customer, :class_name => "User"
  has_many :events
  has_many :calls
  belongs_to :employee, :class_name => "User"

end
