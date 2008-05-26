class OrderItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :order

  # returns item cost
  def cost
    return quantity * item.cost
  end

  def name
    item.name
  end
end
