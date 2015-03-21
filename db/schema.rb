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

ActiveRecord::Schema.define(version: 20141010221509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_notifications", force: :cascade do |t|
    t.integer  "invoice_id"
    t.text     "pay_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_notifications", ["invoice_id"], name: "index_invoice_notifications_on_invoice_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "payment_id"
    t.float    "amount",     default: 0.0
    t.datetime "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  add_index "invoices", ["payment_id"], name: "index_invoices_on_payment_id", using: :btree
  add_index "invoices", ["product_id"], name: "index_invoices_on_product_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.float    "amount",                 default: 0.0
    t.float    "real_amount"
    t.string   "gateway_code"
    t.string   "gateway_payment_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
