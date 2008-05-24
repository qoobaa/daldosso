class CreateShutterConfigs < ActiveRecord::Migration
  def self.up
    create_table :shutter_configs do |t|
      t.integer :window_config_id, :shutter_type_id, :width, :height, :sashes_number
      t.string :name, :description
      t.decimal :cost, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :shutter_configs
  end
end
