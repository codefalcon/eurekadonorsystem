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

ActiveRecord::Schema.define(version: 20130830052257) do

  create_table "blocks", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "block_id"
    t.string   "block_code"
    t.integer  "partner_id"
  end

  add_index "blocks", ["district_id"], name: "index_blocks_on_district_id", using: :btree
  add_index "blocks", ["partner_id"], name: "index_blocks_on_partner_id", using: :btree

  create_table "blockusers", force: true do |t|
    t.integer  "block_id"
    t.integer  "user_id"
    t.integer  "role"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blockusers", ["block_id"], name: "index_blockusers_on_block_id", using: :btree
  add_index "blockusers", ["user_id"], name: "index_blockusers_on_user_id", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "district_id"
    t.string   "district_code"
  end

  create_table "donorinfos", force: true do |t|
    t.integer  "user_id"
    t.integer  "donor_type"
    t.decimal  "amount_donated", precision: 12, scale: 2
    t.decimal  "amount_used",    precision: 12, scale: 2
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donorinfos", ["user_id"], name: "index_donorinfos_on_user_id", using: :btree

  create_table "donorvillages", force: true do |t|
    t.integer  "village_id"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "amount_for_village",  precision: 12, scale: 2
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_of_donor_visits"
  end

  add_index "donorvillages", ["user_id"], name: "index_donorvillages_on_user_id", using: :btree
  add_index "donorvillages", ["village_id"], name: "index_donorvillages_on_village_id", using: :btree

  create_table "partners", force: true do |t|
    t.string   "name"
    t.string   "partner_code"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "phone_number"
    t.integer  "gender"
    t.string   "user_id"
    t.string   "login"
    t.string   "password_digest"
    t.integer  "role"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "villageinfos", force: true do |t|
    t.integer  "village_id"
    t.integer  "funding_status"
    t.decimal  "total_funding_required", precision: 12, scale: 2
    t.integer  "initial_cpi"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.decimal  "local_contributions",    precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "villageinfos", ["village_id"], name: "index_villageinfos_on_village_id", using: :btree

  create_table "villages", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.integer  "block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "village_code"
    t.boolean  "construction"
    t.string   "additional_program"
  end

  add_index "villages", ["block_id"], name: "index_villages_on_block_id", using: :btree

  create_table "villagesummaryreports", force: true do |t|
    t.integer  "village_id"
    t.integer  "children_enrolled"
    t.integer  "children_attended"
    t.integer  "class_working_days"
    t.integer  "current_cpi"
    t.string   "activities_html"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "fees_collected",     precision: 12, scale: 2
  end

  add_index "villagesummaryreports", ["village_id"], name: "index_villagesummaryreports_on_village_id", using: :btree

  create_table "villageusers", force: true do |t|
    t.integer  "village_id"
    t.integer  "user_id"
    t.integer  "role"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grade"
  end

  add_index "villageusers", ["user_id"], name: "index_villageusers_on_user_id", using: :btree
  add_index "villageusers", ["village_id"], name: "index_villageusers_on_village_id", using: :btree

end
