class CreateAdditionalConfigs < ActiveRecord::Migration
  def self.up
    create_table :additional_configs do |t|
      t.integer :additional_product_id
      t.integer :window_config_id
      t.string :description
      t.float :price_per_unit
      t.float :price_per_square_meter
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_configs
  end
end
