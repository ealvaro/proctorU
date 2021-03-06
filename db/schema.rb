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

ActiveRecord::Schema.define(version: 20210414223034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_windows", force: :cascade do |t|
    t.integer  "exam_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "exams", force: :cascade do |t|
    t.string   "title"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "college_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["college_id"], name: "index_users_on_college_id", using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  end

  add_foreign_key "users", "colleges"
end
