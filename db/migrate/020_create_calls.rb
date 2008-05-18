class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.integer :customer_id
      t.integer :order_id
      t.integer :employee_id
      t.datetime :date
      t.string :description
      t.integer :call_status_id

      t.timestamps
    end
  end

  def self.down
    drop_table :calls
  end
end
