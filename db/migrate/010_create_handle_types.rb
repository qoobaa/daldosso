class CreateHandleTypes < ActiveRecord::Migration
  def self.up
    create_table :handle_types do |t|
      t.string :name, :description
      t.decimal :unit_price, :precition => 9, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :handle_types
  end
end
