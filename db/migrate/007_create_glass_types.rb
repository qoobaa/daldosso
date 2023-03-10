class CreateGlassTypes < ActiveRecord::Migration
  def self.up
    create_table :glass_types do |t|
      t.string :name
      t.text :description
      t.integer :thickness
      t.decimal :meter_price, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :glass_types
  end
end
