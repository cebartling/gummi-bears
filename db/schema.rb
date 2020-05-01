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

ActiveRecord::Schema.define(version: 2020_05_01_015522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "daily_time_series_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "stock_id", null: false
    t.date "event_date", null: false
    t.decimal "open_price", null: false
    t.decimal "high_price", null: false
    t.decimal "low_price", null: false
    t.decimal "close_price", null: false
    t.integer "volume", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id", "event_date"], name: "stock_id_and_event_date_unique_idx", unique: true
  end

  create_table "intraday_time_series_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "stock_id", null: false
    t.datetime "event_datetime", null: false
    t.decimal "open_price", null: false
    t.decimal "high_price", null: false
    t.decimal "low_price", null: false
    t.decimal "close_price", null: false
    t.integer "volume", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id", "event_datetime"], name: "stock_id_and_event_datetime_unique_idx", unique: true
  end

  create_table "metrics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "name_unique_idx", unique: true
  end

  create_table "stock_metrics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "metric_id", null: false
    t.uuid "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "symbol", limit: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symbol"], name: "symbol_unique_idx", unique: true
  end

  create_table "user_stock_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_stock_id", null: false
    t.integer "price_in_cents", null: false
    t.integer "shares_count", null: false
    t.datetime "transaction_timestamp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_stocks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "stock_id"], name: "user_id_stock_id_unique_idx", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 50, null: false
    t.string "username", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token", limit: 255
    t.index ["auth_token"], name: "auth_token_unique_idx", unique: true
    t.index ["username"], name: "username_unique_idx", unique: true
  end

  add_foreign_key "daily_time_series_events", "stocks"
  add_foreign_key "intraday_time_series_events", "stocks"
  add_foreign_key "stock_metrics", "metrics"
  add_foreign_key "stock_metrics", "stocks"
  add_foreign_key "user_stock_transactions", "user_stocks"
  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
