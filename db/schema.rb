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

ActiveRecord::Schema.define(version: 20160130170234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_chunks", force: :cascade do |t|
    t.string   "url"
    t.string   "slug"
    t.integer  "met_start"
    t.integer  "met_end"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_chunks_on_channel_id", using: :btree
  end

  create_table "channels", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.integer  "mission_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mission_id"], name: "index_channels_on_mission_id", using: :btree
  end

  create_table "channels_moments", id: false, force: :cascade do |t|
    t.integer "moment_id",  null: false
    t.integer "channel_id", null: false
    t.index ["channel_id", "moment_id"], name: "index_channels_moments_on_channel_id_and_moment_id", using: :btree
    t.index ["moment_id", "channel_id"], name: "index_channels_moments_on_moment_id_and_channel_id", using: :btree
  end

  create_table "missions", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moments", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.integer  "met_start"
    t.integer  "met_end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "moments_stories", id: false, force: :cascade do |t|
    t.integer "moment_id", null: false
    t.integer "story_id",  null: false
    t.index ["moment_id", "story_id"], name: "index_moments_stories_on_moment_id_and_story_id", using: :btree
    t.index ["story_id", "moment_id"], name: "index_moments_stories_on_story_id_and_moment_id", using: :btree
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "transcript_parts", force: :cascade do |t|
    t.text     "text"
    t.integer  "met_start"
    t.integer  "met_end"
    t.integer  "speaker_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_transcript_parts_on_channel_id", using: :btree
    t.index ["speaker_id"], name: "index_transcript_parts_on_speaker_id", using: :btree
  end

  add_foreign_key "channel_chunks", "channels"
  add_foreign_key "channels", "missions"
  add_foreign_key "transcript_parts", "channels"
  add_foreign_key "transcript_parts", "speakers"
end
