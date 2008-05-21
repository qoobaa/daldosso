class CreateAdditionalProducts < ActiveRecord::Migration
  def self.up
    create_table :additional_products do |t|
<<<<<<< HEAD:db/migrate/013_create_additional_products.rb
      t.string :name
      t.string :description
=======
      t.string :name, :description
>>>>>>> kuba/master:db/migrate/013_create_additional_products.rb
      t.integer :additional_group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_products
  end
end
