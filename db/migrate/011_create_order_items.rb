class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :quantity, :default => 1
      t.integer :order_id
      t.references :item, :polymorphic => true
			t.decimal :cost, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
