# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151018202352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "personal_details", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "postcode"
    t.string   "phone"
    t.integer  "uk_status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "min_salary"
    t.integer  "min_day_rate"
    t.string   "permanent_postcode"
    t.integer  "permanent_max_travel_distance"
    t.integer  "max_travel_time"
    t.integer  "num_permanent_roles"
    t.integer  "num_contracts"
    t.integer  "num_extensions"
    t.integer  "user_id"
    t.boolean  "permanent",                         default: false
    t.boolean  "contractor",                        default: false
    t.string   "contract_postcode"
    t.integer  "contract_max_travel_distance"
    t.integer  "permanent_current_notice_period"
    t.integer  "contractor_current_notice_period"
    t.integer  "permanent_work_travel_willingness"
    t.integer  "contract_work_travel_willingness"
    t.datetime "contract_available_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "personal_details", "users"
  add_foreign_key "roles", "users"
end
