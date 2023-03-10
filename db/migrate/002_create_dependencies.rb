class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :dependencies do |t|
      t.integer :feature_one_id, :feature_two_id
      t.decimal :unit_price, :meter_price, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end
