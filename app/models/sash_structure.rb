class SashStructure < ActiveRecord::Base
  has_many :window_configs
  belongs_to :structure
end
