class OrderItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :order

  validates_numericality_of :quantity, :greater_than => 0

  # returns item cost
  def cost
    return quantity * item.cost
  end
end
