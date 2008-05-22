class WindowFeature < ActiveRecord::Base
  has_many  :dependencies_before, :foreign_key =>'feature_one_id', :class_name => 'Dependency'
  has_many  :dependencies_after, :foreign_key =>'feature_two_id', :class_name => 'Dependency'
  has_many  :before_features, :through => :dependencies_after
  has_many  :after_features, :through => :dependencies_before
  has_and_belongs_to_many :window_configs

  validates_presence_of :name, :type
  validates_numericality_of :min_thickness, :max_thickness, :only_integer => true, :greater_than => 0, :allow_nil => true

  def self.types
    %w(Edge LayingKind Model PaintKind Typology Wood)
  end
end
