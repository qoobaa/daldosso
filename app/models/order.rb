class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  has_many :window_configs, :through => :order_items, :foreign_key => 'item_id'
  has_many :product_configs, :through => :order_items, :foreign_key => 'item_id'
  has_many :shutter_configs, :through => :order_items, :foreign_key => 'item_id'
  belongs_to :order_status
  belongs_to :customer, :class_name => "User"
  has_many :events
  has_many :calls
  belongs_to :seller, :class_name => "User"

  validates_associated :order_items, :on => :update
  # return estimated cost of all order items related with order
  def estimated_price
    price = 0
    order_items.each{|item| price+= item.price}
    return price
  end

  def name
    "[#{order_status.name}] - #{customer.name} - #{created_at.to_date.to_s}"
  end

  def is_saved?
    order_status==OrderStatus.saved
  end

  def is_requested?
    orders_status==OrderStatus.requested
  end

  def self.find_requested
    OrderStatus.find_by_name("REQUESTED").orders
  end

  def same_type_orders
    OrderStatus.find_by_name(order_status.name || "").orders || []
  end

  def self.per_page
    10
  end

  def self.search(search, page, current_user = nil)
    if search
      #customer_id = Customer.find_by_name(search.to_s).id rescue -1
      customer_ids = Customer.paginate(:all, :conditions => ['name LIKE ?', "%#{search}%"], :page => page)
      if current_user
        current_user.orders.paginate :all, :conditions => ['customer_id IN (?) OR description LIKE ?', customer_ids, "%#{search}%"], :page => page
      else
        Order.paginate :all,
                       :conditions => ['description LIKE ?',"%#{search}%"],
                       :page => page
      end
    else
      paginate :all, :page => page
    end
  end

end
