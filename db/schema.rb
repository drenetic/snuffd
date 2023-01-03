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

ActiveRecord::Schema[7.0].define(version: 2023_01_03_095103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctor_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctor_profiles_on_user_id"
  end

  create_table "infections", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.bigint "result_id", null: false
    t.boolean "is_active", default: false, null: false
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.index ["result_id"], name: "index_links_on_result_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "test_date"
    t.datetime "next_test_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_results_on_doctor_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "results_infections", force: :cascade do |t|
    t.bigint "infection_id", null: false
    t.bigint "result_id", null: false
    t.string "status"
    t.boolean "is_treated"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["infection_id"], name: "index_results_infections_on_infection_id"
    t.index ["result_id"], name: "index_results_infections_on_result_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patient_reference"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "gender"
    t.string "orientation"
    t.string "location"
    t.string "bio"
    t.datetime "date_of_birth"
    t.boolean "is_doctor"
    t.string "provider_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doctor_profiles", "users"
  add_foreign_key "links", "results"
  add_foreign_key "results", "users"
  add_foreign_key "results", "users", column: "doctor_id"
  add_foreign_key "results_infections", "infections"
  add_foreign_key "results_infections", "results"
end
