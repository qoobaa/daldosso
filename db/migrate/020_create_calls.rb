class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.integer :customer_id, :order_id, :employee_id, :call_status_id
      t.datetime :date
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :calls
  end
end
