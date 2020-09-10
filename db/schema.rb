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

ActiveRecord::Schema.define(version: 20160812232630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkout_paid_items", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.integer "price"
    t.text "body"
    t.bigint "order_checkout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_checkout_id"], name: "index_checkout_paid_items_on_order_checkout_id"
  end

  create_table "item_pics", force: :cascade do |t|
    t.string "pic_url"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "urlseed"
    t.index ["item_id"], name: "index_item_pics_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "main_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "price"
    t.boolean "active"
    t.integer "quantity"
    t.index ["main_category_id"], name: "index_items_on_main_category_id"
  end

  create_table "main_categories", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "template", default: false
  end

  create_table "main_category_pics", force: :cascade do |t|
    t.string "pic_url"
    t.bigint "main_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "urlseed"
    t.index ["main_category_id"], name: "index_main_category_pics_on_main_category_id"
  end

  create_table "order_checkout_transactions", force: :cascade do |t|
    t.bigint "order_checkout_id"
    t.string "action"
    t.integer "amount"
    t.boolean "success"
    t.string "authorization"
    t.string "message"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_checkout_id"], name: "index_order_checkout_transactions_on_order_checkout_id"
  end

  create_table "order_checkouts", force: :cascade do |t|
    t.bigint "order_id"
    t.string "ip_address"
    t.string "first_name"
    t.string "last_name"
    t.string "card_type"
    t.date "card_expires_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "adress"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "phone"
    t.text "instructions"
    t.string "bill_name"
    t.string "bill_adress"
    t.string "bill_city"
    t.string "bill_state"
    t.integer "bill_zip"
    t.date "purchased_at"
    t.boolean "paid_shipped_n_done"
    t.index ["order_id"], name: "index_order_checkouts_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 12, scale: 3
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "tax", precision: 12, scale: 3
    t.decimal "shipping", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.bigint "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
