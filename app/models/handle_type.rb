class HandleType < ActiveRecord::Base
  has_many :window_configs

  validates_presence_of :name
  validates_numericality_of :unit_price, :greater_or_equal_than => 0, :allow_nil => true
end
