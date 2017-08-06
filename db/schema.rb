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

ActiveRecord::Schema.define(version: 20170806170902) do

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

end
