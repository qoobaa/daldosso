class OrderStatus < ActiveRecord::Base
  has_many :orders

  def self.requested
    OrderStatus.find_by_name("REQUESTED")
  end

  def self.saved
    OrderStatus.find_by_name("SAVED")
  end
end
