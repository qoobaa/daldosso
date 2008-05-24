class CreateWindowConfigs < ActiveRecord::Migration
  def self.up
    create_table :window_configs do |t|
      t.integer :glass_color_id,:glass_type_id, :handle_type_id, :sash_structure_id, :height, :width, :user_id
      t.integer :height_medium_rail,:cover_joint_int,:cover_joint_ext
      t.string :finish_quality
      t.decimal :cost, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end
  def self.down
    drop_table :window_configs
  end
end
