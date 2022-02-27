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

ActiveRecord::Schema.define(version: 2022_02_27_195414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.bigint "service_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_appointments_on_service_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "mobile_number"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "salons", force: :cascade do |t|
    t.string "company_name"
    t.string "gstin"
    t.string "pan_number"
    t.text "address"
    t.integer "chairs_counter"
    t.datetime "opening"
    t.datetime "closing"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "days", array: true
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.string "time_taken"
    t.bigint "salon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["salon_id"], name: "index_services_on_salon_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "users"
  add_foreign_key "services", "salons"
end
