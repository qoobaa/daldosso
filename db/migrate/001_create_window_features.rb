class CreateWindowFeatures < ActiveRecord::Migration
  def self.up
    create_table :window_features do |t|
      t.string :name
      t.string :description
			t.integer :min_thickness
      t.integer :max_thickness
			t.string :next_step_type
			t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :window_features
  end
end
