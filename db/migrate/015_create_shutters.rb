class CreateShutters < ActiveRecord::Migration
  def self.up
    create_table :shutters do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :shutters
  end
end
