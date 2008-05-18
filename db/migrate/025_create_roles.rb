class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
		create_table :employees_roles do |t|
			t.integer :employee_id
			t.integer :role_id
			t.timestamps
		end
  end

  def self.down
    drop_table :roles
		drop_table :employees_roles
  end
end
