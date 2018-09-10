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

ActiveRecord::Schema.define(version: 20180909030649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "attr"
    t.string "range"
    t.integer "hero_id", default: 0
    t.integer "pro_pick", default: 0
    t.integer "pro_win", default: 0
    t.integer "pro_ban", default: 0
    t.integer "one_pick", default: 0
    t.integer "one_win", default: 0
    t.integer "two_pick", default: 0
    t.integer "two_win", default: 0
    t.integer "three_pick", default: 0
    t.integer "three_win", default: 0
    t.integer "four_pick", default: 0
    t.integer "four_win", default: 0
    t.integer "five_pick", default: 0
    t.integer "five_win", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "steam_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
