class ShutterConfig < ActiveRecord::Base
  belongs_to :shutter_type
  has_many :order_items, :as => :item
  belongs_to :window_config
end
