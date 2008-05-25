class Customer < User
  has_many :orders
  has_many :calls
  has_many :window_configs, :foreign_key => 'customer_id'
end
