class CreateAdditionalFeatures < ActiveRecord::Migration
  def self.up
    create_table :additional_features do |t|
      t.string :name, :description
      t.decimal :unit_price, :meter_price, :precision => 9, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_features
  end
end
