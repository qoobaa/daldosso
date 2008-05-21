# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 25) do

  create_table "additional_configs", :force => true do |t|
    t.integer  "additional_product_id"
    t.integer  "window_config_id"
    t.string   "description"
    t.decimal  "unit_price",            :precision => 9, :scale => 2
    t.decimal  "meter_price",           :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_feature_configs", :force => true do |t|
    t.integer  "additional_feature_id"
    t.integer  "window_config_id"
    t.string   "config_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_features", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "unit_price",  :precision => 9, :scale => 2
    t.decimal  "meter_price", :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "additional_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_statuses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "order_id"
    t.integer  "employee_id"
    t.integer  "call_status_id"
    t.datetime "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", :force => true do |t|
    t.integer  "feature_one_id"
    t.integer  "feature_two_id"
    t.decimal  "price",          :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "due_date"
    t.datetime "added_date"
    t.datetime "description"
    t.integer  "employee_id"
    t.integer  "order_id"
    t.integer  "event_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "glass_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "thickness"
    t.decimal  "price",       :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "handle_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.integer  "percentual_discount"
    t.integer  "order_status_id"
    t.decimal  "total_amount",        :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sash_structures", :force => true do |t|
    t.integer  "structure_id"
    t.integer  "sashes_number"
    t.decimal  "minimum",       :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shutter_configs", :force => true do |t|
    t.integer  "window_config_id"
    t.integer  "shutter_id"
    t.integer  "width"
    t.integer  "height"
    t.integer  "sashes_number"
    t.string   "name"
    t.string   "description"
    t.decimal  "shutter_cost",     :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shutter_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shutters", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "structures", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "type"
    t.string   "address"
    t.string   "phone_no"
    t.string   "description"
    t.string   "name"
    t.string   "remember_token"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "window_configs", :force => true do |t|
    t.integer  "glass_type_id"
    t.integer  "handle_type_id"
    t.integer  "sash_structure_id"
    t.integer  "height"
    t.integer  "width"
    t.integer  "user_id"
    t.string   "glass_color"
    t.string   "cover_joints_int"
    t.string   "cover_joint_ext"
    t.string   "height_medium_rail"
    t.string   "finish_quality"
    t.float    "window_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "window_configs_window_features", :id => false, :force => true do |t|
    t.integer  "window_config_id"
    t.integer  "window_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "window_features", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "next_step_type"
    t.string   "type"
    t.integer  "min_thickness"
    t.integer  "max_thickness"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
