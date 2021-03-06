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

ActiveRecord::Schema[7.0].define(version: 2022_04_19_171008) do
  create_table "kategoris", force: :cascade do |t|
    t.string "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "nama"
    t.text "deskripsi"
    t.integer "harga"
    t.integer "kategori_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kategori_id"], name: "index_menus_on_kategori_id"
  end

  create_table "order_menus", force: :cascade do |t|
    t.integer "order_id"
    t.integer "menu_id"
    t.integer "porsi", default: 1
    t.integer "harga"
    t.integer "total_harga"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_order_menus_on_menu_id"
    t.index ["order_id"], name: "index_order_menus_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.string "status", default: "new"
    t.integer "total_bayar", default: 0
    t.datetime "order_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "menus", "kategoris"
end
