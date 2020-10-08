# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_08_203323) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_establishments_on_category_id"
    t.index ["user_id"], name: "index_establishments_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "good_air_ventilation"
    t.integer "staff_practicing_safe_covid_protocols"
    t.integer "seats_far_apart"
    t.boolean "outside_seating"
    t.text "additional_comments"
    t.integer "user_id"
    t.integer "establishment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["establishment_id"], name: "index_reviews_on_establishment_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "establishments", "categories"
  add_foreign_key "establishments", "users"
  add_foreign_key "reviews", "establishments"
  add_foreign_key "reviews", "users"
end
