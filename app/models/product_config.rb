class ProductConfig < ActiveRecord::Base
  belongs_to :product
  belongs_to :window_config
  has_one :order_item, :as => :item
end
