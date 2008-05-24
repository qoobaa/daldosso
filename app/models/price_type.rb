class PriceType < ActiveRecord::Base
  has_many :additional_features
  has_many :additional_configs
end
