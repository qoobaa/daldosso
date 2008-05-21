class CreateAdditionalProducts < ActiveRecord::Migration
  def self.up
    create_table :additional_products do |t|
      t.string :name
      t.string :description
      t.integer :additional_group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_products
  end
end
