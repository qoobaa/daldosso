class OrderItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :order
  belongs_to :window_config, :foreign_key => 'item_id'
  belongs_to :product_config, :foreign_key => 'item_id'
  belongs_to :shutter_config, :foreign_key => 'item_id'
  validates_numericality_of :quantity, :greater_than => 0

  # returns item cost
  def cost
    return quantity * item.cost
  end

  def name
    item.name
  end

  # TODO ! make it shorter ??!!
  def path_part
    case item_type
      when "ShutterConfig"
        "shutter_config"
      when "ProductConfig"
        "product_config"
      when "WindowConfig"
        "window_config"
    end
  end

end
