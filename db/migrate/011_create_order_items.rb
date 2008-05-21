class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
<<<<<<< HEAD:db/migrate/011_create_order_items.rb
      t.integer :quantity
      t.integer :order_id
=======
      t.integer :quantity, :order_id
>>>>>>> kuba/master:db/migrate/011_create_order_items.rb
      t.references :item, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
