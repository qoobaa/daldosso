class CreateAdditionalConfigs < ActiveRecord::Migration
  def self.up
    create_table :additional_configs do |t|
      t.integer :additional_product_id
      t.integer :window_config_id
      t.string :description
      t.float :additional_cost
      t.integer :price_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :additional_configs
  end
end
