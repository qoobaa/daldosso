class CreateWindowConfigs < ActiveRecord::Migration
  def self.up
    create_table :window_configs do |t|
      t.integer :glass_type_id, :handle_type_id, :sash_structure_id, :height, :width, :user_id
      t.string :glass_color, :finish_quality
      t.decimal :window_cost, :height_medium_rail, :cover_joint_int, :cover_joint_ext, :precision => 9, :scale => 2
      t.timestamps
    end
  end
  def self.down
    drop_table :window_configs
  end
end
