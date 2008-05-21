class CreateWindowConfigs < ActiveRecord::Migration
  def self.up
    create_table :window_configs do |t|
      t.integer :glass_type_id, :handle_type_id, :sash_structure_id, :height, :width, :user_id
      t.string :glass_color, :cover_joints_int, :cover_joint_ext, :height_medium_rail, :finish_quality
      t.float :window_cost
      t.timestamps
    end
  end
  def self.down
    drop_table :window_configs
  end
end
