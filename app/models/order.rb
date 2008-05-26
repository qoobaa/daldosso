class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  has_many :window_configs, :through => :order_items, :foreign_key => 'item_id'
  belongs_to :order_status
  belongs_to :customer, :class_name => "User"
  has_many :events
  has_many :calls
  belongs_to :employee, :class_name => "User"

  # return estimated cost of all order items related with order
  def estimated_price
    cost = 0
    order_items.each{|item| cost+= item.cost}
    return cost
  end

  def is_saved?
    order_status.name=="Saved"
  end

  def is_requested?
    orders_status.name=="Requested"
  end

end
