class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :dependencies do |t|
			t.integer :feature_one_id
			t.integer :feature_two_id
			t.float :price
      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end
