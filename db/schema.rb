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

ActiveRecord::Schema.define(version: 20140531192755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bills", force: true do |t|
    t.integer  "meal_id",                                               null: false
    t.integer  "resident_id",                                           null: false
    t.integer  "amount",                                  default: 0,   null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.decimal  "amount_decimal", precision: 12, scale: 2, default: 0.0, null: false
  end

  add_index "bills", ["meal_id"], name: "index_bills_on_meal_id", using: :btree
  add_index "bills", ["resident_id"], name: "index_bills_on_resident_id", using: :btree

  create_table "guests", force: true do |t|
    t.string   "name",                    null: false
    t.integer  "multiplier",  default: 2, null: false
    t.integer  "meal_id",                 null: false
    t.integer  "resident_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "residents", ["name"], name: "index_residents_on_name", unique: true, using: :btree

  create_table "units", force: true do |t|
    t.string   "name",                        null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "residents_count", default: 0, null: false
  end

  add_index "units", ["name"], name: "index_units_on_name", unique: true, using: :btree

  add_foreign_key "bills", "meals", name: "bills_meal_id_fk"
  add_foreign_key "bills", "residents", name: "bills_resident_id_fk"

  add_foreign_key "meal_residents", "meals", name: "meal_residents_meal_id_fk"
  add_foreign_key "meal_residents", "residents", name: "meal_residents_resident_id_fk"

  add_foreign_key "residents", "units", name: "residents_unit_id_fk"

end
