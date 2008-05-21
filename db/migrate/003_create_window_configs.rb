class CreateWindowConfigs < ActiveRecord::Migration
  def self.up
    create_table :window_configs do |t|
<<<<<<< HEAD:db/migrate/003_create_window_configs.rb
      t.integer :glass_type_id
      t.integer :handle_type_id
      t.string :glass_color
      t.integer :sash_structure_id
      t.float :height
      t.float :width
      t.string :cover_joints_int
      t.string :cover_joint_ext
      t.string :height_medium_rail
      t.float :window_cost
      t.string :finish_quality
      t.timestamps	
    end
		
    create_table :window_configs_window_features do |t|
            t.integer :window_config_id
            t.integer :window_feature_id
            t.timestamps
    end
  end
  def self.down
    drop_table :window_configs
    drop_table :window_configs_window_features
=======
      t.integer :glass_type_id, :handle_type_id, :sash_structure_id, :height, :width, :user_id
      t.string :glass_color, :cover_joints_int, :cover_joint_ext, :height_medium_rail, :finish_quality
      t.float :window_cost
      t.timestamps
    end
  end
  def self.down
    drop_table :window_configs
>>>>>>> kuba/master:db/migrate/003_create_window_configs.rb
  end
end
