class CreateProductConfigs < ActiveRecord::Migration
  def self.up
    create_table :product_configs do |t|
      t.integer :product_id, :window_config_id
      t.text :description
      t.decimal :cost, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :product_configs
  end
end
