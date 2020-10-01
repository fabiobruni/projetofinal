# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_01_151516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "translated_text_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stars"
    t.index ["translated_text_id"], name: "index_evaluations_on_translated_text_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "submitted_texts", force: :cascade do |t|
    t.string "url"
    t.string "institution"
    t.date "deadline"
    t.string "service_title"
    t.text "service"
    t.text "target_public"
    t.text "service_stages"
    t.text "more_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "potential_public"
    t.index ["user_id"], name: "index_submitted_texts_on_user_id"
  end

  create_table "translated_texts", force: :cascade do |t|
    t.string "url"
    t.string "institution"
    t.date "deadline"
    t.string "service_title"
    t.text "service"
    t.text "target_public"
    t.text "service_stages"
    t.text "more_info"
    t.bigint "user_id", null: false
    t.bigint "submitted_text_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "potential_public"
    t.index ["submitted_text_id"], name: "index_translated_texts_on_submitted_text_id"
    t.index ["user_id"], name: "index_translated_texts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "is_writer"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "evaluations", "translated_texts"
  add_foreign_key "evaluations", "users"
  add_foreign_key "translated_texts", "submitted_texts"
  add_foreign_key "translated_texts", "users"
end
