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

ActiveRecord::Schema.define(version: 20151127230017) do

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

  create_table "blocked_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blocked_users", ["blocked_id"], name: "index_blocked_users_on_blocked_id"
  add_index "blocked_users", ["user_id", "blocked_id"], name: "index_blocked_users_on_user_id_and_blocked_id", unique: true
  add_index "blocked_users", ["user_id"], name: "index_blocked_users_on_user_id"

  create_table "event_invites", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "receiver_id"
    t.boolean  "accepted",    default: false
    t.string   "token",       default: "test"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "event_invites", ["event_id", "receiver_id"], name: "index_event_invites_on_event_id_and_receiver_id", unique: true
  add_index "event_invites", ["event_id"], name: "index_event_invites_on_event_id"
  add_index "event_invites", ["receiver_id"], name: "index_event_invites_on_receiver_id"

  create_table "event_members", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  add_index "event_members", ["event_id"], name: "index_event_members_on_event_id"
  add_index "event_members", ["user_id", "event_id"], name: "index_event_members_on_user_id_and_event_id", unique: true
  add_index "event_members", ["user_id"], name: "index_event_members_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "creator"
    t.string   "title"
    t.float    "longitude",                   null: false
    t.float    "latitude",                    null: false
    t.datetime "start",                       null: false
    t.integer   "duration"
    t.string   "description"
    t.string   "category"
    t.integer  "minReq",		default: 0
    t.integer  "maxReq",		default: 50
    t.boolean  "private",     default: false
    t.boolean  "completed",		default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "creator_id"
  end

  add_index "events", ["creator"], name: "index_events_on_creator"

  create_table "friend_invites", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "token",       default: "test"
    t.boolean  "accepted",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "friend_invites", ["receiver_id"], name: "index_friend_invites_on_receiver_id"
  add_index "friend_invites", ["sender_id", "receiver_id"], name: "index_friend_invites_on_sender_id_and_receiver_id", unique: true
  add_index "friend_invites", ["sender_id"], name: "index_friend_invites_on_sender_id"

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

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
