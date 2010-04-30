# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100330212847) do

  create_table "companies", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computer_allocations", :force => true do |t|
    t.integer  "computer_id", :null => false
    t.integer  "user_id",     :null => false
    t.date     "allocated"
    t.date     "returned"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers", :force => true do |t|
    t.string   "manufacturer",  :limit => 40, :null => false
    t.string   "model",         :limit => 40
    t.string   "description"
    t.string   "form_type",     :limit => 20, :null => false
    t.string   "serial_number", :limit => 40
    t.string   "cpu",           :limit => 20
    t.string   "ram",           :limit => 10
    t.string   "hdd",           :limit => 10
    t.string   "optical",       :limit => 20
    t.string   "os",            :limit => 20, :null => false
    t.string   "service_tag",   :limit => 20
    t.date     "purchase_date"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lookups", :force => true do |t|
    t.string   "lu_key",     :limit => 80,                   :null => false
    t.string   "lu_value",   :limit => 80,                   :null => false
    t.boolean  "lu_active",                :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lookups", ["lu_key"], :name => "index_lookups_on_lu_key"

  create_table "offices", :force => true do |t|
    t.string   "code",        :limit => 16
    t.string   "description"
    t.integer  "company_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sites", :force => true do |t|
    t.string   "code",       :limit => 8
    t.string   "address1",   :limit => 80
    t.string   "address2",   :limit => 80
    t.string   "city",       :limit => 30
    t.string   "state",      :limit => 2
    t.string   "zipcode",    :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", :force => true do |t|
    t.string   "publisher",     :limit => 80, :null => false
    t.string   "title_version", :limit => 80, :null => false
    t.date     "purchase_date"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_actions", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "add_user_id"
    t.text     "action_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "computer_allocation_id"
    t.integer  "add_user_id"
    t.string   "ticket_type",            :limit => 20
    t.string   "contact_name",           :limit => 40
    t.string   "contact_phone",          :limit => 15
    t.string   "contact_email",          :limit => 40
    t.text     "ticket_desc"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                         :default => false
    t.string   "first_name",      :limit => 40
    t.string   "last_name",       :limit => 40
    t.string   "email",           :limit => 40
  end

end
