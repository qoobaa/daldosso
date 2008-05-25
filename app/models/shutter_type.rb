class ShutterType < ActiveRecord::Base
  has_many :shutter_configs
  validates_presence_of :name, :message => "must be present"
end
