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

ActiveRecord::Schema.define(version: 20150210231136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "puzzle_views", force: :cascade do |t|
    t.integer "user_id"
    t.integer "puzzle_id"
    t.boolean "solved"
    t.boolean "received_hint"
    t.boolean "upvote"
  end

  add_index "puzzle_views", ["puzzle_id"], name: "index_puzzle_views_on_puzzle_id", using: :btree
  add_index "puzzle_views", ["user_id"], name: "index_puzzle_views_on_user_id", using: :btree

  create_table "puzzles", force: :cascade do |t|
    t.string  "clue_string"
    t.string  "solution_string"
    t.integer "difficulty"
    t.integer "creator_id"
    t.string  "hint_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "handle"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "puzzle_views", "puzzles"
  add_foreign_key "puzzle_views", "users"
end
