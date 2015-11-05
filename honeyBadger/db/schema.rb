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

ActiveRecord::Schema.define(version: 20151031202944) do

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "startTime"
    t.datetime "endTime"
    t.string   "description"
    t.string   "category"
    t.integer  "minRequired"
    t.boolean  "private",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "messageID"
    t.string   "recieverID"
    t.string   "message"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "user_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_accounts", ["user_id"], name: "index_user_accounts_on_user_id", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
