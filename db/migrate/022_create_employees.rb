class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :login                     
      t.string :email                     
      t.string :crypted_password, :limit => 40
      t.string :salt, :limit => 40
      t.string :remember_token
      t.datetime :remember_token_expires_at
      
      t.string :name
      t.string :address
      t.string :phone_no

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
