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

ActiveRecord::Schema.define(version: 20160317184604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "achievements", ["user_id"], name: "index_achievements_on_user_id", using: :btree

  create_table "personal_details", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "postcode"
    t.string   "phone"
    t.integer  "uk_status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "uk_citizen"
    t.boolean  "eu_citizen"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "level"
    t.string   "institution"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "qualification_extra_description"
  end

  create_table "references", force: :cascade do |t|
    t.string   "referee_first_name"
    t.string   "referee_last_name"
    t.string   "referee_email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
  end

  add_index "references", ["user_id"], name: "index_references_on_user_id", using: :btree

  create_table "role_distances", force: :cascade do |t|
    t.integer "distance"
    t.string  "label"
  end

  create_table "role_travel_willingness_options", force: :cascade do |t|
    t.integer "value"
    t.string  "label"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "min_salary"
    t.integer  "min_day_rate"
    t.string   "permanent_postcode"
    t.integer  "num_permanent_roles"
    t.integer  "num_contracts"
    t.integer  "num_extensions"
    t.integer  "user_id"
    t.boolean  "permanent",                                   default: false
    t.boolean  "contractor",                                  default: false
    t.string   "contract_postcode"
    t.integer  "permanent_current_notice_period"
    t.integer  "contractor_current_notice_period"
    t.datetime "contract_available_at"
    t.integer  "contract_role_distance_id"
    t.integer  "permanent_role_distance_id"
    t.integer  "contract_role_travel_willingness_option_id"
    t.integer  "permanent_role_travel_willingness_option_id"
    t.integer  "position"
  end

  create_table "user_competencies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competency"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_experience_references", force: :cascade do |t|
    t.integer  "user_experience_id"
    t.integer  "reference_id"
    t.integer  "expertise"
    t.boolean  "in_last_five_years"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "referee_has_experience", default: true
  end

  add_index "user_experience_references", ["reference_id"], name: "index_user_experience_references_on_reference_id", using: :btree
  add_index "user_experience_references", ["user_experience_id"], name: "index_user_experience_references_on_user_experience_id", using: :btree

  create_table "user_experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "primary_activity"
    t.integer  "years_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "secondary_activity"
    t.boolean  "in_last_five_years"
    t.string   "other_primary_activity"
    t.string   "other_secondary_activity"
    t.string   "type"
    t.integer  "company"
    t.integer  "context"
  end

  add_index "user_experiences", ["type"], name: "index_user_experiences_on_type", using: :btree
  add_index "user_experiences", ["user_id"], name: "index_user_experiences_on_user_id", using: :btree

  create_table "user_reference_competencies", force: :cascade do |t|
    t.integer  "reference_id"
    t.integer  "competency"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "video_statements", force: :cascade do |t|
    t.string   "url"
    t.string   "uuid"
    t.string   "thumb_url"
    t.string   "small_thumb_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_statements", ["user_id"], name: "index_video_statements_on_user_id", using: :btree

  add_foreign_key "personal_details", "users"
  add_foreign_key "roles", "users"
end
