class ShutterConfig < ActiveRecord::Base
  belongs_to :shutter_type
  has_one :order_item, :as => :item, :dependent => :destroy
  belongs_to :window_config
  validates_presence_of :name, :shutter_type, :width, :height
  validates_numericality_of :height, :width, :only_integer => true, :greater_than => 0

  def order
    return self.order_item.order if self.order_item
    return nil
  end
end
