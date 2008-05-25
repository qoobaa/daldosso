class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.text :description
      t.datetime :due_date, :added_date
      t.integer :user_id, :order_id, :event_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
