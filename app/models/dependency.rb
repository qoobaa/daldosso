class Dependency < ActiveRecord::Base
  belongs_to :before_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_one_id'
  belongs_to :after_feature, :class_name => 'WindowFeature', :foreign_key => 'feature_two_id'

  validates_presence_of :before_feature, :after_feature
  validates_numericality_of :price, :greater_or_equal_than => 0, :allow_nil => true
end
