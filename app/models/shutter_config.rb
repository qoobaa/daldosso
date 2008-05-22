class ShutterConfig < ActiveRecord::Base
	belongs_to :shutter_type
	has_one :order_item, :as => :item
	belongs_to :window_config
end
