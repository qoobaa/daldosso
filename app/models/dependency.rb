class Dependency < ActiveRecord::Base
  belongs_to :before_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_one_id'
  belongs_to :after_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_two_id'

  validates_presence_of :before_feature, :after_feature
  validates_numericality_of :unit_price, :meter_price, :greater_or_equal_than => 0, :allow_nil => true

  def type
    [before_feature.class,after_feature.class]
  end

  def cost(window_config)
    return glass_meter_calculation(window_config) if type[1]==GlassType
    return regular_meter_calculation(window_config)
  end

  def regular_meter_calculation(window_config)
    return size * meter_price
  end

  def glass_meter_calculation(window_config)
    code = window_config.sash_structure.structure
  end
end
