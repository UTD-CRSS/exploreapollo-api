# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_25_071930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "active_record_internal_metadatas", id: false, force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "unique_active_record_internal_metadatas", unique: true
  end

  create_table "audio_cache_items", id: :serial, force: :cascade do |t|
    t.integer "channels", default: [], null: false, array: true
    t.bigint "met_start", null: false
    t.bigint "met_end", null: false
    t.string "format", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audio_segments", id: :serial, force: :cascade do |t|
    t.text "url", null: false
    t.string "title", null: false
    t.string "slug", null: false
    t.bigint "met_start", null: false
    t.bigint "met_end", null: false
    t.integer "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_audio_segments_on_channel_id"
    t.index ["slug"], name: "index_audio_segments_on_slug", unique: true
  end

  create_table "channels", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.integer "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_channels_on_mission_id"
    t.index ["slug"], name: "index_channels_on_slug", unique: true
  end

  create_table "channels_moments", id: false, force: :cascade do |t|
    t.integer "moment_id", null: false
    t.integer "channel_id", null: false
    t.index ["channel_id", "moment_id"], name: "index_channels_moments_on_channel_id_and_moment_id", unique: true
    t.index ["moment_id", "channel_id"], name: "index_channels_moments_on_moment_id_and_channel_id", unique: true
  end

  create_table "fearless_steps_survey", id: :serial, force: :cascade do |t|
    t.string "fname", limit: 64, null: false
    t.string "lname", limit: 64, null: false
    t.string "email", limit: 64, null: false
    t.string "person", limit: 64, null: false
    t.text "persontext"
    t.string "fieldtype", limit: 64, null: false
    t.text "fieldtypetext"
    t.string "importance", limit: 64, null: false
    t.string "usage", limit: 64, null: false
    t.text "usagetext"
    t.string "importance_all", limit: 64, null: false
    t.text "usage_fieldtext"
    t.text "metadata"
    t.text "applications"
    t.text "tools"
    t.text "commentstext"
    t.string "sad", limit: 64
    t.string "spkr_diar", limit: 64
    t.string "spkr_recog", limit: 64
    t.string "speech_recog", limit: 64
    t.string "sent_detec_keyword_topic", limit: 64
    t.string "grp_engage", limit: 64
    t.string "preserve_data", limit: 64
    t.string "spkr_trait", limit: 64
    t.string "quefour_other", limit: 64
    t.text "que8"
    t.text "que9"
  end

  create_table "fearless_steps_users", id: :serial, force: :cascade do |t|
    t.string "fname", limit: 64, null: false
    t.string "lname", limit: 64, null: false
    t.string "email", limit: 64, null: false
    t.text "purpose"
    t.boolean "verified", null: false
    t.string "vercode", limit: 64, null: false
    t.string "institution", limit: 64, null: false
    t.string "country", limit: 64, null: false
    t.text "chall"
    t.boolean "survey"
  end

  create_table "fearless_steps_users_two", id: :serial, force: :cascade do |t|
    t.string "fname", limit: 64, null: false
    t.string "lname", limit: 64, null: false
    t.string "email", limit: 64, null: false
    t.text "purpose"
    t.boolean "verified", null: false
    t.string "vercode", limit: 64, null: false
    t.string "institution", limit: 64, null: false
    t.string "country", limit: 64, null: false
    t.text "chall"
    t.boolean "survey"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "media", id: :serial, force: :cascade do |t|
    t.text "url", null: false
    t.string "title", null: false
    t.string "slug", null: false
    t.text "caption"
    t.string "alt_text"
    t.text "description"
    t.integer "mission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_media_on_mission_id"
    t.index ["slug"], name: "index_media_on_slug", unique: true
  end

  create_table "media_attachments", id: :serial, force: :cascade do |t|
    t.integer "media_id", null: false
    t.string "media_attachable_type", null: false
    t.integer "media_attachable_id", null: false
    t.bigint "met_start"
    t.bigint "met_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_attachable_type", "media_attachable_id"], name: "media_attachable_type_and_id"
    t.index ["media_id"], name: "index_media_attachments_on_media_id"
  end

  create_table "metrics", id: :serial, force: :cascade do |t|
    t.string "type", null: false
    t.bigint "met_start", null: false
    t.bigint "met_end", null: false
    t.hstore "data", null: false
    t.integer "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_metrics_on_channel_id"
    t.index ["data"], name: "index_metrics_on_data", using: :gin
  end

  create_table "missions", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "start_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_missions_on_slug", unique: true
  end

  create_table "moments", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "met_start", null: false
    t.bigint "met_end", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_moments_on_slug", unique: true
  end

  create_table "moments_stories", id: false, force: :cascade do |t|
    t.integer "moment_id", null: false
    t.integer "story_id", null: false
    t.integer "order"
    t.index ["moment_id", "story_id"], name: "index_moments_stories_on_moment_id_and_story_id", unique: true
    t.index ["story_id", "moment_id"], name: "index_moments_stories_on_story_id_and_moment_id", unique: true
  end

  create_table "multi_channels", force: :cascade do |t|
    t.string "operation", null: false
    t.string "audioUrl", null: false
    t.integer "block_index", null: false
    t.integer "nugget_index", null: false
    t.string "channel_name", null: false
    t.bigint "tape_id", null: false
    t.bigint "mission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_multi_channels_on_mission_id"
    t.index ["tape_id"], name: "index_multi_channels_on_tape_id"
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "photo_url"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_people_on_slug", unique: true
  end

  create_table "stories", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_stories_on_slug", unique: true
  end

  create_table "tapes", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.integer "met_start", null: false
    t.integer "met_end", null: false
    t.string "operation", null: false
    t.integer "min_block"
    t.integer "max_block"
    t.bigint "mission_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_tapes_on_mission_id"
    t.index ["slug"], name: "index_tapes_on_slug", unique: true
  end

  create_table "transcribers", force: :cascade do |t|
    t.string "transcriberUrl", null: false
    t.bigint "multi_channel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["multi_channel_id"], name: "index_transcribers_on_multi_channel_id"
  end

  create_table "transcript_items", id: :serial, force: :cascade do |t|
    t.text "text", null: false
    t.bigint "met_start", null: false
    t.bigint "met_end", null: false
    t.integer "person_id"
    t.integer "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_transcript_items_on_channel_id"
    t.index ["person_id"], name: "index_transcript_items_on_person_id"
  end

  add_foreign_key "audio_segments", "channels"
  add_foreign_key "channels", "missions"
  add_foreign_key "media", "missions"
  add_foreign_key "media_attachments", "media"
  add_foreign_key "metrics", "channels"
  add_foreign_key "multi_channels", "channels", column: "channel_name", primary_key: "slug"
  add_foreign_key "multi_channels", "missions"
  add_foreign_key "multi_channels", "tapes"
  add_foreign_key "tapes", "missions"
  add_foreign_key "transcribers", "multi_channels"
  add_foreign_key "transcript_items", "channels"
  add_foreign_key "transcript_items", "people"
end
