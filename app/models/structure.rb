class Structure < ActiveRecord::Base
  has_many :sash_structures

  validates_presence_of :name
end
