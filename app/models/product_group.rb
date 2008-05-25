class ProductGroup < ActiveRecord::Base
  has_many :products
  validates_presence_of :name, :message => "must be present"
end
