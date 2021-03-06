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

ActiveRecord::Schema.define(version: 2019_05_21_013313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attestations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "work_or_study"
    t.string "customer_name"
    t.date "date"
    t.string "hour"
    t.string "fit_unfit"
    t.string "observation"
    t.boolean "deleted", default: false
    t.string "cro"
    t.string "unfit_days"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attestations_on_user_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.date "date"
    t.string "hour"
    t.string "duration"
    t.text "annotation"
    t.boolean "deleted", default: false
    t.bigint "user_id"
    t.bigint "customer_id"
    t.boolean "canceled", default: false
    t.boolean "sms_sent", default: false
    t.date "sms_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.index ["customer_id"], name: "index_consultations_on_customer_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "gender"
    t.string "code"
    t.string "email"
    t.string "celphone"
    t.string "phone"
    t.string "zipcode"
    t.string "address"
    t.string "number"
    t.string "distric"
    t.string "state"
    t.string "city"
    t.string "complement"
    t.string "cpf"
    t.string "annotation"
    t.bigint "user_id"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.text "image_base64"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "plan_payments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "pagarme_transaction_id"
    t.string "card_brand"
    t.string "card_last_digits"
    t.decimal "price", precision: 14, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plan_payments_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "customer_name"
    t.string "customer_cpf"
    t.decimal "total", precision: 14, scale: 2
    t.string "services"
    t.string "location"
    t.date "date"
    t.bigint "user_id"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.string "phone"
    t.string "email"
    t.boolean "solved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "token"
    t.boolean "disabled", default: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.boolean "plan_status", default: false
    t.date "plan_date"
    t.string "card_id"
    t.string "card_brand"
    t.string "card_last_digits"
    t.string "card_expiration"
    t.string "cro"
    t.string "address"
    t.string "api_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attestations", "users"
  add_foreign_key "consultations", "customers"
  add_foreign_key "consultations", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "plan_payments", "users"
  add_foreign_key "receipts", "users"
  add_foreign_key "tickets", "users"
end
