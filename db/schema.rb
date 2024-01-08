# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_08_222509) do
  create_table "applications", force: :cascade do |t|
    t.string "app_id"
    t.string "client_id"
    t.string "client_secret"
    t.string "redirect_url"
    t.integer "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_applications_on_app_id", unique: true
    t.index ["client_id"], name: "index_applications_on_client_id", unique: true
    t.index ["client_secret"], name: "index_applications_on_client_secret", unique: true
    t.index ["users_id"], name: "index_applications_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "applications", "users", column: "users_id"
end
