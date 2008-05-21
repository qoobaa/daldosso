class CreateShutterTypes < ActiveRecord::Migration
  def self.up
    create_table :shutter_types do |t|
      t.string :name, :description
      t.timestamps
    end
  end

  def self.down
    drop_table :shutter_types
  end
end
