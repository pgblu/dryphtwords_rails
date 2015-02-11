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

ActiveRecord::Schema.define(version: 20150211030235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dryphtwords_puzzles", force: :cascade do |t|
    t.string   "clue_string"
    t.string   "solution_string"
    t.integer  "difficulty"
    t.integer  "creator_id"
    t.string   "hint_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "puzzle_views", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dryphtwords_puzzle_id"
    t.boolean "solved"
    t.boolean "received_hint"
    t.boolean "upvote"
  end

  add_index "puzzle_views", ["dryphtwords_puzzle_id"], name: "index_puzzle_views_on_dryphtwords_puzzle_id", using: :btree
  add_index "puzzle_views", ["user_id"], name: "index_puzzle_views_on_user_id", using: :btree

  create_table "puzzles_words", force: :cascade do |t|
    t.integer "word_id"
    t.integer "dryphtwords_puzzle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "handle"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "puzzle_views", "dryphtwords_puzzles"
  add_foreign_key "puzzle_views", "users"
end
