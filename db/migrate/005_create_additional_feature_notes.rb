class CreateAdditionalFeatureNotes < ActiveRecord::Migration
  def self.up
    create_table :additional_feature_notes do |t|
      t.integer :additional_feature_id, :window_config_id
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_feature_notes
  end
end
