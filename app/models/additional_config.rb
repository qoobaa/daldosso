class AdditionalConfig < ActiveRecord::Base
  belongs_to :additional_product
  belongs_to :window_config
  has_one :order_item, :as => :item
end
