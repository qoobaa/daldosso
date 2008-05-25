class WindowConfig < ActiveRecord::Base
  has_and_belongs_to_many :window_features
  has_many :additional_feature_notes
  has_many :additional_features, :through => :additional_feature_notes
  has_many :shutter_configs
  has_many :shutter_types, :through => :shutter_configs
  has_many :order_items, :as => :item
  belongs_to :customer, :class_name => 'User'
  belongs_to :glass_type
  belongs_to :glass_color
  belongs_to :sash_structure
  belongs_to :handle_type

  validates_presence_of :customer, :glass_type, :glass_color, :sash_structure, :handle_type
  validates_numericality_of :height, :width, :only_integer => true, :greater_than => 0

  def estimated_cost
    cost = 0
    for i in 0..window_features.size-2
      feature_before = window_features[i]
      feature_after = window_features[i+1]
      dependency = feature_before.dependencies_before.detect{|db| db.after_feature==feature_after}
      cost+= dependency.meter_price!=nil ? dependency.meter_price : 0
    end
    return cost
  end

  def cost
    estimated_cost
  end
end

