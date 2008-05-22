class SashStructure < ActiveRecord::Base
	has_many :window_configs
	belongs_to :structure

  def name
    "#{structure.name} with #{sashes_number} sashes"
  end
end
