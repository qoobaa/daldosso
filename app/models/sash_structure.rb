class SashStructure < ActiveRecord::Base
  has_many :window_configs
  belongs_to :structure

  def name
    "#{structure.name} with #{sashes_number} sashes"
  end

  def code
    structure.name
  end

  def self.code_f
    "F"
  end

  def self.code_pf
    "PF"
  end
end
