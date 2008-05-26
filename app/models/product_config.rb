class ProductConfig < ActiveRecord::Base
  belongs_to :product
  belongs_to :window_config
  has_many :order_items, :as => :item
  validates_presence_of :cost, :product, :name
end
