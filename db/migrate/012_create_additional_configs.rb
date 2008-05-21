class CreateAdditionalConfigs < ActiveRecord::Migration
  def self.up
    create_table :additional_configs do |t|
      t.integer :additional_product_id, :window_config_id
      t.string :description
      t.decimal :unit_price, :precision => 9, :scale => 2
      t.decimal :meter_price, :precision => 9, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_configs
  end
end
