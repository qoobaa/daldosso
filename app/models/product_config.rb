class ProductConfig < ActiveRecord::Base
  belongs_to :product
  belongs_to :window_config
  has_one :order_item, :as => :item, :dependent => :destroy
  validates_presence_of :cost, :product, :name

  def order
    return self.order_item.order if self.order_item
    return nil
  end
end
