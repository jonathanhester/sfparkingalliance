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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130307092225) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "devices", :force => true do |t|
    t.integer  "user_id"
    t.string   "device_id"
    t.string   "registration_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "devices", ["user_id"], :name => "index_devices_on_user_id"

  create_table "friend_events", :force => true do |t|
    t.integer  "user_id"
    t.string   "fbid"
    t.string   "name"
    t.string   "event"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friend_events", ["user_id"], :name => "index_friend_events_on_user_id"

  create_table "friends", :force => true do |t|
    t.integer  "user_id"
    t.string   "fbid"
    t.string   "name"
    t.datetime "status_modified_date"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "status"
  end

  add_index "friends", ["user_id", "fbid"], :name => "index_friends_on_user_id_and_fbid"

  create_table "users", :force => true do |t|
    t.string   "fbid"
    t.string   "token"
    t.datetime "token_invalid_date"
    t.boolean  "token_invalid"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "last_synced"
    t.string   "name"
  end

  add_index "users", ["fbid"], :name => "index_users_on_fbid"

end
