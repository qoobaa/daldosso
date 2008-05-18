class CreateAdditionalFeatureConfigs < ActiveRecord::Migration
  def self.up
    create_table :additional_feature_configs do |t|
      t.integer :additional_feature_id
      t.integer :window_config_id
      t.string :config_notes
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_feature_configs
  end
end
