class AdditionalFeature < ActiveRecord::Base
  has_many :additional_features_window_configs, :class_name => 'AdditionalFeaturesWindowConfig', :foreign_key => 'additional_feature_id'
  has_many :window_configs, :through => :additional_feature_configs

  validates_presence_of :name
  validates_numericality_of :unit_price, :meter_price, :greater_or_equal_than => 0, :allow_nil => true
end
