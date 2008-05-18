class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
			t.integer :customer_id
			t.integer :employee_id
			t.float :percentual_discount
			t.float :total_amount
			t.integer :order_status_id
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
