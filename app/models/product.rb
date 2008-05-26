class Product < ActiveRecord::Base
  belongs_to :product_group
  has_many :product_configs
  validates_presence_of :name, :message => "must be present"
end
