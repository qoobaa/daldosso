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
  has_many :order_items, :as => :item

  validates_presence_of :customer, :glass_type, :glass_color, :sash_structure, :handle_type
  validates_numericality_of :height, :width, :only_integer => true, :greater_than => 0

  def to_s
    ret = ""
    window_features.each { |f| ret << f.to_s + ", " }
    ret << "#{glass_type.name}, #{glass_color.name}, #{handle_type.name}..."
    return ret
  end

  def name
    self.to_s[0..40]
  end

end
