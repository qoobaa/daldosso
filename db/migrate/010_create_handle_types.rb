class CreateHandleTypes < ActiveRecord::Migration
  def self.up
    create_table :handle_types do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :handle_types
  end
end
