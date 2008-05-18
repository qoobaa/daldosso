class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_no

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
