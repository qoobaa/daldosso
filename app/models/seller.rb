class Seller < User
  has_many :orders, :foreign_key => 'seller_id'
end
