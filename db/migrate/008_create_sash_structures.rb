class CreateSashStructures < ActiveRecord::Migration
  def self.up
    create_table :sash_structures do |t|
      t.integer :structure_id, :sashes_number
      t.decimal :minimum, :precision => 9, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :sash_structures
  end
end
