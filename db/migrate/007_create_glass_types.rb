class CreateGlassTypes < ActiveRecord::Migration
  def self.up
    create_table :glass_types do |t|
      t.string :name
      t.string :description
      t.integer :thickness
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :glass_types
  end
end
