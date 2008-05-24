class CreateGlassColors < ActiveRecord::Migration
  def self.up
    create_table :glass_colors do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :glass_colors
  end
end
