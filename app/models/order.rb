class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  belongs_to :order_status
  belongs_to :customer, :class_name => "User"
  has_many :events
  has_many :calls
  belongs_to :seller, :class_name => "User"

  # return estimated cost of all order items related with order
  def estimated_price
    cost = 0
    order_items.each{|item| cost+= item.cost}
    return cost
  end

  def name
    "[#{order_status.name}]-#{customer.id}-#{customer.name}-#{created_at}"
  end

  def self.find_pending_orders
    self.find(:all, :conditions => [ "order_status_id = 2"])
  end
end
