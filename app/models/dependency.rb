class Dependency < ActiveRecord::Base
  belongs_to :before_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_one_id'
  belongs_to :after_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_two_id'

  validates_presence_of :before_feature, :after_feature
  validates_numericality_of :unit_price, :meter_price, :greater_or_equal_than => 0, :allow_nil => true

  def pair
    [before_feature.class,after_feature.class]
  end

  def cost(window_config)
    return discounted_meter_calculation(window_config,0.5) if (window_config.without_sashes? && pair[1]==Wood)
    return regular_meter_calculation(window_config)
  end

  def regular_meter_calculation(window_config)
    window_config.window_area * meter_price
  end

  def discounted_meter_calculation(window_config,discount_factor)
    cost = regular_meter_calculation(window_config)
    return cost * discount_factor
  end
end
