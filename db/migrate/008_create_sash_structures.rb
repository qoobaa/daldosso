class CreateSashStructures < ActiveRecord::Migration
  def self.up
    create_table :sash_structures do |t|
      t.integer :structure_id
      t.integer :sashes_number
      t.float :minimum

      t.timestamps
    end
  end

  def self.down
    drop_table :sash_structures
  end
end
