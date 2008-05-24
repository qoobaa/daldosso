class WindowConfig < ActiveRecord::Base
	has_and_belongs_to_many :window_features
	has_many :additional_feature_configs
	has_many :additional_features, :through => :additional_feature_configs
	has_many :additional_configs
	has_many :shutter_configs
  has_many :shutter_types, :through => :shutter_configs
  belongs_to :customer, :class_name => 'User'
	belongs_to :glass_type
  belongs_to :glass_color
	belongs_to :sash_structure
	belongs_to :handle_type
  belongs_to :glass_color
	has_many :order_items, :as => :item
end

