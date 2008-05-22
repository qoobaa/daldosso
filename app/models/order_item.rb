class OrderItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :order
end
