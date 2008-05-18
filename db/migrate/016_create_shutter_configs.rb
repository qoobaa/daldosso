class CreateShutterConfigs < ActiveRecord::Migration
  def self.up
    create_table :shutter_configs do |t|
      t.integer :window_config_id
      t.integer :shutter_id
      t.string :name
      t.integer :width
      t.integer :height
      t.integer :sashes_number
      t.string :description
      t.float :shutter_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :shutter_configs
  end
end
