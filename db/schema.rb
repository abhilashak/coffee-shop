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

ActiveRecord::Schema.define(version: 2021_07_09_175848) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 60, null: false
    t.decimal "price", precision: 7, scale: 2, null: false
    t.decimal "tax", precision: 7, scale: 2, null: false
    t.string "category", limit: 50
    t.integer "free_with_item_id"
    t.integer "discount_with_item_id"
    t.decimal "discount_percentage", precision: 4, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_items_on_category"
    t.index ["discount_with_item_id"], name: "index_items_on_discount_with_item_id"
    t.index ["free_with_item_id"], name: "index_items_on_free_with_item_id"
  end

  create_table "order_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "total", precision: 9, scale: 2, null: false
    t.string "status", limit: 20, default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
