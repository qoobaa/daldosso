class CreateAdditionalFeatures < ActiveRecord::Migration
  def self.up
    create_table :additional_features do |t|
      t.string :name
      t.string :description
      t.float :price_per_unit
      t.float :price_per_square_meter

      t.timestamps
    end
  end

  def self.down
    drop_table :additional_features
  end
end
