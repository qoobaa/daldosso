class Customer < User
  has_many :orders
  has_many :window_configs, :foreign_key => 'customer_id'

  def config_templates
    return self.window_configs.find(:all).reject{|wc| wc.order_item!=nil}
  end

  # results per page when paginating
  def self.per_page
    6
  end

  # searching with pagination
  def self.search(search, page)
    if search
      # searching by name || address || email || description
      paginate :all, :conditions => ['name LIKE ? OR address LIKE ? OR email LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"], :page => page
    else
      # getting all customers
      paginate :all, :page => page
    end
  end
end
