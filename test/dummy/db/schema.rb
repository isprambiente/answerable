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

ActiveRecord::Schema[7.0].define(version: 2022_07_14_193642) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answerable_answers", force: :cascade do |t|
    t.string "answerable_type", null: false
    t.bigint "answerable_id", null: false
    t.bigint "answerable_question_id", null: false
    t.text "value", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answerable_question_id"], name: "index_answerable_answers_on_answerable_question_id"
    t.index ["answerable_type", "answerable_id"], name: "index_answerable_answers_on_answerable"
  end

  create_table "answerable_options", force: :cascade do |t|
    t.bigint "answerable_question_id", null: false
    t.text "value"
    t.integer "weight", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answerable_question_id"], name: "index_answerable_options_on_answerable_question_id"
  end

  create_table "answerable_questions", force: :cascade do |t|
    t.string "questionable_type", null: false
    t.bigint "questionable_id", null: false
    t.text "title", default: "", null: false
    t.text "note", default: "", null: false
    t.integer "type", default: 0, null: false
    t.integer "weight", default: 0, null: false
    t.boolean "mandatory", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionable_type", "questionable_id"], name: "index_answerable_questions_on_questionable"
    t.index ["weight"], name: "index_answerable_questions_on_weight"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answerable_answers", "answerable_questions"
  add_foreign_key "answerable_options", "answerable_questions"
end
