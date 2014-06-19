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

ActiveRecord::Schema.define(version: 20140619152927) do

  create_table "attendances", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id"
  add_index "attendances", ["user_id", "event_id"], name: "index_attendances_on_user_id_and_event_id", unique: true
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location_name"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["created_by_id"], name: "index_events_on_created_by_id"

  create_table "file_uploads", force: true do |t|
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_uploads", ["event_id"], name: "index_file_uploads_on_event_id"
  add_index "file_uploads", ["user_id"], name: "index_file_uploads_on_user_id"

  create_table "images", force: true do |t|
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lon",        default: 0.0
    t.float    "lat",        default: 0.0
  end

  add_index "images", ["event_id"], name: "index_images_on_event_id"
  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "locations", force: true do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.integer  "event_id"
    t.float    "radius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["event_id"], name: "index_locations_on_event_id"
  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude"

  create_table "schedules", force: true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["event_id"], name: "index_schedules_on_event_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "nickname",               default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
