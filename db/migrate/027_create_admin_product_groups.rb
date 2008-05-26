class CreateAdminProductGroups < ActiveRecord::Migration
  def self.up
    create_table :admin_product_groups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_product_groups
  end
end
