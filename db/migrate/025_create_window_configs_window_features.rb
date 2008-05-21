class CreateWindowConfigsWindowFeatures < ActiveRecord::Migration
  def self.up
    create_table :window_configs_window_features, :id => false do |t|
      t.integer :window_config_id, :window_feature_id
      t.timestamps
    end
  end
  def self.down
    drop_table :window_configs_window_features
  end
end
