class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :email, :type, :phone_number, :name, :remember_token
      t.text :address, :description
      t.string :crypted_password, :salt, :limit => 40
      t.datetime :remember_token_expires_at
      t.timestamps
    end
  end
  def self.down
    drop_table :users
  end
end
