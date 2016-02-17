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

ActiveRecord::Schema.define(version: 20160217212907) do

  create_table "agents", force: :cascade do |t|
    t.integer "computer_id"
  end

  add_index "agents", ["computer_id"], name: "index_agents_on_computer_id"

  create_table "businesses", force: :cascade do |t|
  end

  create_table "computers", force: :cascade do |t|
    t.integer "business_id"
    t.string  "ip_external"
  end

  add_index "computers", ["business_id"], name: "index_computers_on_business_id"

  create_table "nics", force: :cascade do |t|
    t.integer "computer_id"
    t.string  "ip"
  end

  add_index "nics", ["computer_id"], name: "index_nics_on_computer_id"

end
