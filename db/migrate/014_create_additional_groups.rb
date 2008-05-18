class CreateAdditionalGroups < ActiveRecord::Migration
  def self.up
    create_table :additional_groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :additional_groups
  end
end
