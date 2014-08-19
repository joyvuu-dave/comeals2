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

ActiveRecord::Schema.define(version: 20140819092520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "admin_users", ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true, using: :btree
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bills", force: true do |t|
    t.integer  "meal_id",                                                 null: false
    t.integer  "resident_id",                                             null: false
    t.integer  "amount",                                  default: 0,     null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.decimal  "amount_decimal", precision: 12, scale: 2, default: 0.0,   null: false
    t.boolean  "reconciled",                              default: false, null: false
  end

  add_index "bills", ["meal_id"], name: "index_bills_on_meal_id", using: :btree
  add_index "bills", ["resident_id"], name: "index_bills_on_resident_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "guests", force: true do |t|
    t.string   "name",                    null: false
    t.integer  "multiplier",  default: 2, null: false
    t.integer  "meal_id",                 null: false
    t.integer  "resident_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guests", ["meal_id"], name: "index_guests_on_meal_id", using: :btree
  add_index "guests", ["resident_id"], name: "index_guests_on_resident_id", using: :btree

  create_table "meal_residents", force: true do |t|
    t.integer  "meal_id",     null: false
    t.integer  "resident_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "meal_residents", ["meal_id", "resident_id"], name: "index_meal_residents_on_meal_id_and_resident_id", using: :btree

  create_table "meals", force: true do |t|
    t.date     "date",                    null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "bills_count", default: 0, null: false
  end

  add_index "meals", ["date"], name: "index_meals_on_date", unique: true, using: :btree

  create_table "residents", force: true do |t|
    t.string   "name",                   null: false
    t.integer  "multiplier", default: 2, null: false
    t.integer  "unit_id",                null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug"
  end

  add_index "residents", ["name"], name: "index_residents_on_name", unique: true, using: :btree
  add_index "residents", ["slug"], name: "index_residents_on_slug", unique: true, using: :btree
  add_index "residents", ["unit_id"], name: "index_residents_on_unit_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name",                        null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "residents_count", default: 0, null: false
    t.string   "slug"
  end

  add_index "units", ["name"], name: "index_units_on_name", unique: true, using: :btree
  add_index "units", ["slug"], name: "index_units_on_slug", unique: true, using: :btree

end
