class ShutterConfig < ActiveRecord::Base
  belongs_to :shutter_type
  has_many :order_items, :as => :item
  belongs_to :window_config
  validates_presence_of :name, :shutter_type, :width, :height
  validates_numericality_of :height, :width, :only_integer => true, :greater_than => 0
end
