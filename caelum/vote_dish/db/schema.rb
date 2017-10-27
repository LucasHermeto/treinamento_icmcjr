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

ActiveRecord::Schema.define(version: 20170601013754) do

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 80
    t.integer  "age",        limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",       limit: 80
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "dishes_restaurants", id: false, force: :cascade do |t|
    t.integer "dish_id",       limit: 4
    t.integer "restaurant_id", limit: 4
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "client_id",     limit: 4
    t.integer  "restaurant_id", limit: 4
    t.float    "remark",        limit: 24
    t.float    "spend",         limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "qualifications", ["client_id"], name: "index_qualifications_on_client_id", using: :btree
  add_index "qualifications", ["restaurant_id"], name: "index_qualifications_on_restaurant_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer  "dish_id",    limit: 4
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       limit: 80
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "specialty",  limit: 40
  end

end
