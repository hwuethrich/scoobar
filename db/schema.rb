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

ActiveRecord::Schema.define(version: 20141209094101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: true do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "capacity"
  end

  create_table "bookings", force: true do |t|
    t.integer  "event_id",                            null: false
    t.integer  "customer_id",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",       precision: 8, scale: 2
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id", using: :btree
  add_index "bookings", ["event_id", "customer_id"], name: "index_bookings_on_event_id_and_customer_id", unique: true, using: :btree
  add_index "bookings", ["event_id"], name: "index_bookings_on_event_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "first_name",           null: false
    t.string   "last_name",            null: false
    t.date     "date_of_birth",        null: false
    t.integer  "gender",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "post_code"
    t.string   "certification_name"
    t.string   "certification_number"
    t.date     "certification_date"
    t.date     "last_dive_on"
    t.integer  "number_of_dives"
    t.string   "hotel_name"
    t.string   "room_number"
  end

  create_table "equipment", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "name",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "comment"
  end

  add_index "equipment", ["category_id"], name: "index_equipment_on_category_id", using: :btree

  create_table "equipment_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_logbooks", force: true do |t|
    t.integer  "event_id",   null: false
    t.datetime "time_in",    null: false
    t.integer  "dive_time",  null: false
    t.float    "max_depth",  null: false
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_logbooks", ["event_id"], name: "index_event_logbooks_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time",                                             null: false
    t.datetime "end_time",                                               null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.integer  "bookings_count",                         default: 0,     null: false
    t.integer  "trips_id"
    t.boolean  "night_dive",                             default: false, null: false
    t.integer  "boat_id"
    t.integer  "capacity"
    t.integer  "guide_id"
    t.decimal  "price",          precision: 8, scale: 2
  end

  add_index "events", ["end_time"], name: "index_events_on_end_time", using: :btree
  add_index "events", ["guide_id"], name: "index_events_on_guide_id", using: :btree
  add_index "events", ["start_time"], name: "index_events_on_start_time", using: :btree
  add_index "events", ["trip_id"], name: "index_events_on_trip_id", using: :btree

  create_table "guides", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: true do |t|
    t.integer  "customer_id",  null: false
    t.integer  "equipment_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "start_time",   null: false
    t.datetime "end_time"
  end

  add_index "rentals", ["customer_id"], name: "index_rentals_on_customer_id", using: :btree
  add_index "rentals", ["end_time"], name: "index_rentals_on_end_time", using: :btree
  add_index "rentals", ["equipment_id"], name: "index_rentals_on_equipment_id", using: :btree
  add_index "rentals", ["start_time"], name: "index_rentals_on_start_time", using: :btree

  create_table "trips", force: true do |t|
    t.string   "code",                               null: false
    t.string   "name",                               null: false
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.decimal  "price",      precision: 8, scale: 2
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "events"
  add_foreign_key "equipment", "equipment_categories", column: "category_id"
  add_foreign_key "events", "boats"
  add_foreign_key "events", "guides"
  add_foreign_key "events", "trips"
  add_foreign_key "rentals", "customers"
  add_foreign_key "rentals", "equipment"
end
