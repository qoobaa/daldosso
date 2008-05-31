class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  has_many :window_configs, :through => :order_items, :foreign_key => 'item_id'
  belongs_to :order_status
  belongs_to :customer, :class_name => "User"
  has_many :events
  has_many :calls
  belongs_to :seller, :class_name => "User"

  # return estimated cost of all order items related with order
  def estimated_price
    price = 0
    order_items.each{|item| price+= item.price}
    return price
  end

  def name
    "[#{order_status.name}]-#{customer.id}-#{customer.name}-#{created_at}"
  end

  def is_saved?
    order_status==OrderStatus.saved
  end

  def self.find_reqested_orders
    self.find(:all, :conditions => [ "order_status.name = ?", 'REQUESTED'])
  end

  def is_requested?
    orders_status==OrderStatus.requested
  end

end
