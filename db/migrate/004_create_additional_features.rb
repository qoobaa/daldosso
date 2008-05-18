class CreateAdditionalFeatures < ActiveRecord::Migration
  def self.up
    create_table :additional_features do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :price_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :additional_features
  end
end
