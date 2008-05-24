class SashStructure < ActiveRecord::Base
	has_many :window_configs
	belongs_to :structure

  def name
    return structure.name + " :: " + sashes_number.to_s + " sashes"
  end
end
