class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :product_group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
