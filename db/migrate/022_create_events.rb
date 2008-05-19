class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :due_date
      t.datetime :added_date
      t.integer :employee_id
      t.integer :order_id
      t.integer :event_type_id
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
