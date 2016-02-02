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

ActiveRecord::Schema.define(version: 20160130235824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_cache_items", force: :cascade do |t|
    t.integer  "channels",   default: [], null: false, array: true
    t.integer  "met_start",               null: false
    t.integer  "met_end",                 null: false
    t.string   "format",                  null: false
    t.string   "url",                     null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "audio_segments", force: :cascade do |t|
    t.string   "url",        null: false
    t.string   "title",      null: false
    t.string   "slug",       null: false
    t.integer  "met_start",  null: false
    t.integer  "met_end",    null: false
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_audio_segments_on_channel_id", using: :btree
    t.index ["slug"], name: "index_audio_segments_on_slug", unique: true, using: :btree
  end

  create_table "channels", force: :cascade do |t|
    t.string   "slug",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "mission_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mission_id"], name: "index_channels_on_mission_id", using: :btree
    t.index ["slug"], name: "index_channels_on_slug", unique: true, using: :btree
  end

  create_table "channels_moments", id: false, force: :cascade do |t|
    t.integer "moment_id",  null: false
    t.integer "channel_id", null: false
    t.index ["channel_id", "moment_id"], name: "index_channels_moments_on_channel_id_and_moment_id", using: :btree
    t.index ["moment_id", "channel_id"], name: "index_channels_moments_on_moment_id_and_channel_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "missions", force: :cascade do |t|
    t.string   "slug",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "start_time",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["slug"], name: "index_missions_on_slug", unique: true, using: :btree
  end

  create_table "moments", force: :cascade do |t|
    t.string   "slug",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "met_start",   null: false
    t.integer  "met_end",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["slug"], name: "index_moments_on_slug", unique: true, using: :btree
  end

  create_table "moments_stories", id: false, force: :cascade do |t|
    t.integer "moment_id", null: false
    t.integer "story_id",  null: false
    t.index ["moment_id", "story_id"], name: "index_moments_stories_on_moment_id_and_story_id", using: :btree
    t.index ["story_id", "moment_id"], name: "index_moments_stories_on_story_id_and_moment_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.string   "photo_url"
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_people_on_slug", unique: true, using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "slug",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["slug"], name: "index_stories_on_slug", unique: true, using: :btree
  end

  create_table "transcript_items", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "met_start",  null: false
    t.integer  "met_end",    null: false
    t.integer  "person_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_transcript_items_on_channel_id", using: :btree
    t.index ["person_id"], name: "index_transcript_items_on_person_id", using: :btree
  end

  add_foreign_key "audio_segments", "channels"
  add_foreign_key "channels", "missions"
  add_foreign_key "transcript_items", "channels"
  add_foreign_key "transcript_items", "people"
end
