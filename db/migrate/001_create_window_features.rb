class CreateWindowFeatures < ActiveRecord::Migration
  def self.up
    create_table :window_features do |t|
      t.string :name, :description, :next_step_type, :type
      t.integer :min_thickness, :max_thickness
      t.timestamps
    end
  end

  def self.down
    drop_table :window_features
  end
end
