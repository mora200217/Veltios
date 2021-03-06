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

ActiveRecord::Schema.define(version: 20180927164000) do

  create_table "difference_reservations", force: :cascade do |t|
    t.integer "element_id"
    t.integer "reservation_block"
    t.date "reservation_date"
    t.integer "reservation_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.text "desciption"
    t.string "brand"
    t.string "units"
    t.decimal "uncertainty"
    t.boolean "available"
    t.integer "amount"
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "preview_file_name"
    t.string "preview_content_type"
    t.integer "preview_file_size"
    t.datetime "preview_updated_at"
  end

  create_table "reservation_differences", force: :cascade do |t|
    t.integer "element_id"
    t.integer "block"
    t.date "date"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reserve_items", force: :cascade do |t|
    t.integer "element_id"
    t.integer "reserve_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_reserve_items_on_element_id"
    t.index ["reserve_id"], name: "index_reserve_items_on_reserve_id"
  end

  create_table "reserve_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reserves", force: :cascade do |t|
    t.integer "total"
    t.integer "reserve_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reserve_status_id"], name: "index_reserves_on_reserve_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
