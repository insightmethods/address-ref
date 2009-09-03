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

ActiveRecord::Schema.define(:version => 11) do

  create_table "contact_lines", :force => true do |t|
    t.string   "label"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id", :limit => 11
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "company_name"
    t.boolean  "is_company"
    t.integer  "updated_by",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "notes"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
