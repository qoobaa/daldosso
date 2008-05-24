class CreateWindowFeatures < ActiveRecord::Migration
  def self.up
    create_table :window_features do |t|
      t.string :name, :next_step_type, :type
      t.text :description
      t.integer :min_thickness, :max_thickness
      t.timestamps
    end
  end

  def self.down
    drop_table :window_features
  end
end
