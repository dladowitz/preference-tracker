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

ActiveRecord::Schema.define(version: 20160225003634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "password_resets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showing_trackings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.integer  "price"
    t.float    "bathrooms"
    t.integer  "bedrooms"
    t.integer  "design_personality"
    t.integer  "exterior"
    t.integer  "general_condition"
    t.integer  "kitchen"
    t.integer  "neighborhood"
    t.integer  "landscaping"
    t.integer  "square_footage"
    t.integer  "master_bedroom"
    t.integer  "commute"
    t.integer  "home_layout"
    t.integer  "local_schools"
    t.text     "notes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
