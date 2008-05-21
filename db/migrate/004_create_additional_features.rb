class CreateAdditionalFeatures < ActiveRecord::Migration
  def self.up
    create_table :additional_features do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price
      t.decimal :meter_price

      t.timestamps
    end
  end

  def self.down
    drop_table :additional_features
  end
end
