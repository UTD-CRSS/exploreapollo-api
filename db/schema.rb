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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_chunks", force: :cascade do |t|
    t.integer "channel",             null: false
    t.text    "name",                null: false
    t.text    "url",                 null: false
    t.integer "met_start", limit: 8, null: false
    t.integer "met_end",   limit: 8, null: false
  end

  create_table "channels", force: :cascade do |t|
    t.integer "mission",     null: false
    t.text    "name",        null: false
    t.text    "title",       null: false
    t.text    "description"
  end

  create_table "migrations", force: :cascade do |t|
    t.string   "name",   limit: 255, null: false
    t.datetime "run_on",             null: false
  end

  create_table "missions", force: :cascade do |t|
    t.text     "name",           null: false
    t.text     "title",          null: false
    t.datetime "met_start_time", null: false
  end

  create_table "moment_channel_join", force: :cascade do |t|
    t.integer "moment_id",  null: false
    t.integer "channel_id", null: false
  end

  create_table "moment_story_join", force: :cascade do |t|
    t.integer "moment_id",    null: false
    t.integer "story_id",     null: false
    t.integer "moment_order"
  end

  create_table "moments", force: :cascade do |t|
    t.text     "name",                                                           null: false
    t.text     "title",                                                          null: false
    t.text     "description"
    t.integer  "met_start",   limit: 8,                                          null: false
    t.integer  "met_end",     limit: 8,                                          null: false
    t.datetime "created",               default: "now()"
  end

  create_table "speakers", force: :cascade do |t|
    t.text "name",      null: false
    t.text "title",     null: false
    t.text "photo_url", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.text     "name",                                                 null: false
    t.text     "title",                                                null: false
    t.text     "description"
    t.datetime "created",     default: "now()"
  end

  create_table "transcript_parts", force: :cascade do |t|
    t.text    "message",              null: false
    t.integer "met_start",  limit: 8, null: false
    t.integer "met_end",    limit: 8, null: false
    t.integer "speaker_id",           null: false
    t.integer "channel_id",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password"
  end

  add_foreign_key "channel_chunks", "channels", column: "channel", name: "channel_chunks_channel_fkey"
  add_foreign_key "channels", "missions", column: "mission", name: "channels_mission_fkey"
  add_foreign_key "moment_channel_join", "channels", name: "moment_channel_join_channel_id_fkey"
  add_foreign_key "moment_channel_join", "moments", name: "moment_channel_join_moment_id_fkey"
  add_foreign_key "moment_story_join", "moments", name: "moment_story_join_moment_id_fkey"
  add_foreign_key "moment_story_join", "stories", name: "moment_story_join_story_id_fkey"
  add_foreign_key "transcript_parts", "channels", name: "transcript_parts_channel_id_fkey"
  add_foreign_key "transcript_parts", "speakers", name: "transcript_parts_speaker_id_fkey"
end
