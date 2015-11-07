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

ActiveRecord::Schema.define(version: 20151103234316) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.string   "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "email_id"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "creator"
    t.string   "title"
    t.float    "longitude",                   null: false
    t.float    "latitude",                    null: false
    t.datetime "start",                       null: false
    t.string   "duration"
    t.string   "description"
    t.string   "category"
    t.integer  "minReq"
    t.boolean  "private",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "creator_id"
  end

  add_index "events", ["creator"], name: "index_events_on_creator"

  create_table "messages", force: :cascade do |t|
    t.string   "user_ID"
    t.string   "recieverID"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userName"
    t.string   "fName"
    t.string   "lName"
    t.string   "email"
    t.string   "description"
    t.float    "shenaniganExp"
    t.float    "fitnessExp"
    t.float    "educationExp"
    t.float    "philanthropyExp"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
