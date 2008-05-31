class OrderItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :order
  belongs_to :window_config, :foreign_key => 'item_id'
  validates_numericality_of :quantity, :greater_than => 0

  # returns item cost
  def price
    return quantity * cost
  end

  def name
    item.name
  end
end
