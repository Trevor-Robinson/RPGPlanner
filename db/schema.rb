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

ActiveRecord::Schema.define(version: 2021_07_16_182725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "factions", force: :cascade do |t|
    t.string "name"
    t.string "faction_type"
    t.integer "tier"
    t.text "goal"
    t.text "description"
    t.text "notable_assets"
    t.text "qirks"
    t.text "situation"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_factions_on_campaign_id"
  end

  create_table "job_factions", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "faction_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_job_factions_on_faction_id"
    t.index ["job_id"], name: "index_job_factions_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_type"
    t.text "details"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_jobs_on_campaign_id"
  end

  create_table "notable_places", force: :cascade do |t|
    t.bigint "system_id"
    t.string "name"
    t.text "description"
    t.text "rule"
    t.integer "wealth"
    t.integer "crime"
    t.integer "tech"
    t.integer "weird"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["system_id"], name: "index_notable_places_on_system_id"
  end

  create_table "npcs", force: :cascade do |t|
    t.bigint "campaign_id"
    t.string "name"
    t.string "description"
    t.string "want"
    t.string "need"
    t.string "unique_feature"
    t.string "trait_1"
    t.string "trait_2"
    t.string "trait_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_npcs_on_campaign_id"
  end

  create_table "pcs", force: :cascade do |t|
    t.string "name"
    t.text "background"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_pcs_on_campaign_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "heat", default: 0
    t.integer "wanted_level", default: 0
    t.index ["campaign_id"], name: "index_systems_on_campaign_id"
  end

  create_table "turves", force: :cascade do |t|
    t.bigint "system_id"
    t.bigint "faction_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_turves_on_faction_id"
    t.index ["system_id"], name: "index_turves_on_system_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "factions", "campaigns"
  add_foreign_key "job_factions", "factions"
  add_foreign_key "job_factions", "jobs"
  add_foreign_key "jobs", "campaigns"
  add_foreign_key "notable_places", "systems"
  add_foreign_key "npcs", "campaigns"
  add_foreign_key "pcs", "campaigns"
  add_foreign_key "systems", "campaigns"
  add_foreign_key "turves", "factions"
  add_foreign_key "turves", "systems"
end
