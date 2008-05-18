class AdditionalConfig < ActiveRecord::Base
	belongs_to :additional_product
	belongs_to :window_config
	belongs_to :price_type
	has_one :order_item, :as => :item
end
