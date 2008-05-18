class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table "customers", :force => true do |t|
      t.string :login                     
      t.string :email                     
      t.string :crypted_password, :limit => 40
      t.string :salt, :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string :remember_token
      t.datetime :remember_token_expires_at
      
      t.string :name
      t.string :address
      t.string :phone_no
      t.string :info
    end
  end

  def self.down
    drop_table "customers"
  end
end
