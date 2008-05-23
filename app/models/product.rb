class Product < ActiveRecord::Base
  belongs_to :product_group
  has_many :product_configs
end
