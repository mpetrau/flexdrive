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

ActiveRecord::Schema.define(version: 20171123193114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "startDate"
    t.integer "duration", default: 31
    t.integer "KMdriven", default: 0
    t.bigint "contract_id"
    t.bigint "vehicle_id"
    t.string "status", default: "requested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_bookings_on_contract_id"
    t.index ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.date "startDate"
    t.integer "discount", default: 0
    t.string "status"
    t.bigint "offer_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_contracts_on_offer_id"
    t.index ["person_id"], name: "index_contracts_on_person_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "price", default: 0
    t.string "name"
    t.string "description"
    t.string "status", default: "draft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "address"
    t.string "email"
    t.string "firstName"
    t.string "surName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "colour"
    t.integer "manufactureYear"
    t.integer "KM", default: 0
    t.string "fuelType"
    t.integer "enginePower"
    t.string "status", default: "available"
    t.bigint "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "licensePlate"
    t.index ["offer_id"], name: "index_vehicles_on_offer_id"
  end

  add_foreign_key "bookings", "contracts"
  add_foreign_key "bookings", "vehicles"
  add_foreign_key "contracts", "offers"
  add_foreign_key "contracts", "people"
  add_foreign_key "vehicles", "offers"
end
