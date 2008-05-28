class Customer < User
  has_many :orders
  has_many :window_configs, :foreign_key => 'customer_id'

  def config_templates
    return self.window_configs.find(:all).reject{|wc| wc.order_item!=nil}
  end
end
