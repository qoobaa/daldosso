class Order < ActiveRecord::Base
	has_many :order_items
	belongs_to :order_status
	belongs_to :customer
	has_many :events
	has_many :calls
	belongs_to :seller, :foreign_key => 'seller_id'
end
