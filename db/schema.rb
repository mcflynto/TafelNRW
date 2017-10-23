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

ActiveRecord::Schema.define(version: 20171023095723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "house_number"
    t.string "city"
    t.string "phone"
    t.string "plz"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "donation_tafels", force: :cascade do |t|
    t.bigint "donations_id"
    t.bigint "tafels_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donations_id"], name: "index_donation_tafels_on_donations_id"
    t.index ["tafels_id"], name: "index_donation_tafels_on_tafels_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donator_id"
    t.bigint "transporter_id"
    t.string "food"
    t.integer "amount"
    t.string "unit"
    t.string "expiry_date"
    t.boolean "ordered"
    t.string "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donator_id"], name: "index_donations_on_donator_id"
    t.index ["transporter_id"], name: "index_donations_on_transporter_id"
  end

  create_table "donations_tafels", id: false, force: :cascade do |t|
    t.bigint "donation_id"
    t.bigint "tafel_id"
    t.index ["donation_id"], name: "index_donations_tafels_on_donation_id"
    t.index ["tafel_id"], name: "index_donations_tafels_on_tafel_id"
  end

  create_table "donators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tafels", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tafels_transporters", id: false, force: :cascade do |t|
    t.bigint "transporter_id"
    t.bigint "tafel_id"
    t.index ["tafel_id"], name: "index_tafels_transporters_on_tafel_id"
    t.index ["transporter_id"], name: "index_tafels_transporters_on_transporter_id"
  end

  create_table "transporters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "password_confirmation"
    t.string "salt"
    t.string "name"
    t.boolean "admin"
    t.bigint "tafel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["tafel_id"], name: "index_users_on_tafel_id"
  end

end
