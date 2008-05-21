class CreateAdditionalFeatures < ActiveRecord::Migration
  def self.up
    create_table :additional_features do |t|
      t.string :name, :description
      t.decimal :unit_price, :precision => 9, :scale => 2
      t.decimal :meter_price, :precision => 9, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_features
  end
end
