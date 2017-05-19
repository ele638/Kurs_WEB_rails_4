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

ActiveRecord::Schema.define(version: 20170502152223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "my_clients", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "details",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_clients", ["name"], name: "index_my_clients_on_name", unique: true, using: :btree

  create_table "my_items", force: :cascade do |t|
    t.float    "height"
    t.float    "width"
    t.float    "length"
    t.float    "weight"
    t.date     "incoming_date"
    t.integer  "my_client_id"
    t.date     "issue_date"
    t.integer  "my_rack_id"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "my_items", ["my_client_id"], name: "index_my_items_on_my_client_id", using: :btree
  add_index "my_items", ["my_rack_id", "position"], name: "index_my_items_on_my_rack_id_and_position", unique: true, using: :btree
  add_index "my_items", ["my_rack_id"], name: "index_my_items_on_my_rack_id", using: :btree

  create_table "my_racks", force: :cascade do |t|
    t.integer  "number",     null: false
    t.integer  "my_room_id", null: false
    t.integer  "places",     null: false
    t.float    "height",     null: false
    t.float    "width",      null: false
    t.float    "length",     null: false
    t.float    "max_weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_racks", ["my_room_id", "number"], name: "index_my_racks_on_my_room_id_and_number", unique: true, using: :btree
  add_index "my_racks", ["my_room_id"], name: "index_my_racks_on_my_room_id", using: :btree

  create_table "my_rooms", force: :cascade do |t|
    t.string   "name",       null: false
    t.float    "volume",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_rooms", ["name"], name: "index_my_rooms_on_name", unique: true, using: :btree

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "info",       null: false
    t.text     "full_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["info"], name: "index_roles_on_info", unique: true, using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.date     "birthday"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "my_items", "my_clients"
  add_foreign_key "my_items", "my_racks"
  add_foreign_key "my_racks", "my_rooms"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
end
