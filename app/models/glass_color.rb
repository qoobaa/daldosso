class GlassColor < ActiveRecord::Base
  has_many :window_configs

  validates_presence_of :name
end
