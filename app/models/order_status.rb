class OrderStatus < ActiveRecord::Base
  has_many :orders

  def self.requested
    OrderStatus.find_by_name("Requested")
  end
end
