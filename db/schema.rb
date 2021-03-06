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

ActiveRecord::Schema.define(:version => 20131011113146) do

  create_table "atfal_events", :force => true do |t|
    t.string   "title"
    t.string   "place"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "basketballs", :force => true do |t|
    t.string   "team_a"
    t.integer  "result_a",   :default => 0
    t.string   "team_b"
    t.integer  "result_b",   :default => 0
    t.string   "round"
    t.string   "group"
    t.string   "place"
    t.integer  "duration"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "game_id"
  end

  create_table "competitions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "crickets", :force => true do |t|
    t.string   "team_a"
    t.integer  "result_a",   :default => 0
    t.string   "team_b"
    t.integer  "result_b",   :default => 0
    t.string   "round"
    t.string   "group"
    t.string   "place"
    t.integer  "duration"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "game_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "place"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "comment"
    t.string   "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "international_volleyballs", :force => true do |t|
    t.string   "team_a"
    t.integer  "result_a",   :default => 0
    t.string   "team_b"
    t.integer  "result_b",   :default => 0
    t.string   "round"
    t.string   "group"
    t.string   "place"
    t.integer  "duration"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "game_id"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "zone"
    t.string   "region"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "soccers", :force => true do |t|
    t.string   "game_id"
    t.string   "team_a"
    t.integer  "result_a",   :default => 0
    t.string   "team_b"
    t.integer  "result_b",   :default => 0
    t.string   "round"
    t.string   "group"
    t.string   "place"
    t.integer  "duration"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "volleyballs", :force => true do |t|
    t.string   "team_a"
    t.integer  "result_a",   :default => 0
    t.string   "team_b"
    t.integer  "result_b",   :default => 0
    t.string   "round"
    t.string   "group"
    t.string   "place"
    t.integer  "duration"
    t.datetime "startime"
    t.datetime "endtime"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "game_id"
  end

end
