class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :order_id
      t.references :item, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
