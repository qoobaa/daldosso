class Dependency < ActiveRecord::Base
  belongs_to :before_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_one_id'
  belongs_to :after_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_two_id'

  validates_presence_of :before_feature, :after_feature
  validates_numericality_of :unit_price, :meter_price, :greater_or_equal_than => 0, :allow_nil => true

  def type
    before_feature.class.to_s+after_feature.class.to_s
  end

  def self.model_wood
    "ModelWood"
  end

  def self.wood_typology
    "TypologyWood"
  end

  def cost(window_config)
    case self.type
    when Dependency.model_wood
      return model_typology_calculation(window_config)
    when Dependency.wood_typology
      return typology_wood_calculation(window_config)
    end
      return 0
  end

  def model_wood_calculation(window_config)
    return 1
  end

  def wood_typology_calculation(window_config)
    return 2
  end
end
