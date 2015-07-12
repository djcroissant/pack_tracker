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

ActiveRecord::Schema.define(version: 20150711232933) do

  create_table "climbers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbers_expeditions", id: false, force: :cascade do |t|
    t.integer "climber_id"
    t.integer "expedition_id"
  end

  add_index "climbers_expeditions", ["climber_id"], name: "index_climbers_expeditions_on_climber_id"
  add_index "climbers_expeditions", ["expedition_id"], name: "index_climbers_expeditions_on_expedition_id"

  create_table "expeditions", force: :cascade do |t|
    t.string   "title"
    t.integer  "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expeditions_packed_items", id: false, force: :cascade do |t|
    t.integer "expedition_id"
    t.integer "packed_item_id"
  end

  add_index "expeditions_packed_items", ["expedition_id"], name: "index_expeditions_packed_items_on_expedition_id"
  add_index "expeditions_packed_items", ["packed_item_id"], name: "index_expeditions_packed_items_on_packed_item_id"

  create_table "inventory_items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "weight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "climber_id"
  end

  add_index "inventory_items", ["climber_id"], name: "index_inventory_items_on_climber_id"

  create_table "packed_items", force: :cascade do |t|
    t.integer  "climber_id"
    t.string   "title"
    t.text     "description"
    t.integer  "weight"
    t.boolean  "group_item"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "packed_items", ["climber_id"], name: "index_packed_items_on_climber_id"

end
