class CreateGlassTypes < ActiveRecord::Migration
  def self.up
    create_table :glass_types do |t|
      t.string :name, :description
      t.integer :thickness
      t.decimal :price, :precision => 9, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :glass_types
  end
end
