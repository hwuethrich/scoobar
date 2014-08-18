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

ActiveRecord::Schema.define(version: 20140817034930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time",  null: false
    t.datetime "end_time",    null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["end_time"], name: "index_events_on_end_time", using: :btree
  add_index "events", ["start_time"], name: "index_events_on_start_time", using: :btree

end
