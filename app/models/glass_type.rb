class GlassType < ActiveRecord::Base
  has_many :window_configs

  validates_presence_of :name
  validates_numericality_of :meter_price, :greater_or_equal_than => 0, :allow_nil => true
  validates_numericality_of :thickness, :greater_than => 0, :only_integer => true
  
  def self.search(search)
    if search
      find(:all, :conditions=>['name LIKE ? OR description LIKE ?',"%#{search}%","%#{search}%"])
    else
      find(:all)
    end
  end
  
end
