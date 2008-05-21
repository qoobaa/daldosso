class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :due_date, :added_date, :description
      t.integer :employee_id, :order_id, :event_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
