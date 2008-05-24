class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :customer_id, :seller_id, :percentual_discount, :order_status_id
      t.decimal :total_amount, :precision => 9, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
