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

ActiveRecord::Schema.define(version: 20131103164719) do

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "violation_id"
    t.integer  "upvote",       default: 0
    t.integer  "downvote",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "games", force: true do |t|
    t.datetime "date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_team"
    t.string   "away_team"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "team_id"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refs", force: true do |t|
    t.string   "number_name"
    t.integer  "game_id"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "coach"
    t.string   "name"
    t.string   "img"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.integer  "challenge_rating"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "violations", force: true do |t|
    t.string   "name"
    t.string   "quarter"
    t.string   "time"
    t.integer  "game_id"
    t.string   "description"
    t.integer  "violation_upvote",   default: 0
    t.integer  "violation_downvote", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.integer  "ref_id"
    t.integer  "user_id"
  end

end
