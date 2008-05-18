class CreateCallStatuses < ActiveRecord::Migration
  def self.up
    create_table :call_statuses do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :call_statuses
  end
end
