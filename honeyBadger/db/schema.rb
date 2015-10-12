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

ActiveRecord::Schema.define(version: 20151007002832) do

  create_table "events", force: :cascade do |t|
    t.integer  "eventID"
    t.string   "creator"
    t.string   "coordinates"
    t.datetime "date"
    t.datetime "startTime"
    t.string   "duration"
    t.string   "description"
    t.string   "category"
    t.integer  "minRequired"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "messageID"
    t.string   "senderID"
    t.string   "recieverID"
    t.string   "message"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userProfile", force: :cascade do |t|
    t.string   "userName"
    t.string   "fName"
    t.string   "lName"
    t.string   "email"
    t.string   "description"
    t.float    "shenaniganExp"
    t.float    "fitnessExp"
    t.float    "educationExp"
    t.float    "philanthropyExp"
    t.string   "picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string   "accountID"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
