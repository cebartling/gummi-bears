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

ActiveRecord::Schema.define(version: 2021_04_03_150901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
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

  create_table "notifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.text "message", null: false
    t.boolean "read", default: false, null: false
    t.datetime "notification_timestamp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notification_timestamp"], name: "index_notifications_on_notification_timestamp"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_stock_id", null: false
    t.integer "transaction_type", null: false
    t.integer "price_in_cents", null: false
    t.integer "shares_count", null: false
    t.integer "total_amount_in_cents", default: 0, null: false
    t.datetime "order_timestamp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_timestamp"], name: "index_orders_on_order_timestamp"
    t.index ["transaction_type"], name: "index_orders_on_transaction_type"
  end

  create_table "relative_strength_index_analytics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "stock_id", null: false
    t.integer "interval_type", null: false
    t.integer "series_type", null: false
    t.integer "time_period", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "data"
    t.index ["stock_id", "interval_type", "series_type", "time_period"], name: "relative_strength_index_analytics_unique_idx"
  end

  create_table "simple_moving_average_analytics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "stock_id", null: false
    t.integer "interval_type", null: false
    t.integer "series_type", null: false
    t.integer "time_period", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "data"
    t.index ["stock_id", "interval_type", "series_type", "time_period"], name: "simple_moving_average_analytics_unique_idx"
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
    t.decimal "current_price", precision: 12, scale: 4
    t.decimal "open_price", precision: 12, scale: 4
    t.decimal "high_price", precision: 12, scale: 4
    t.decimal "low_price", precision: 12, scale: 4
    t.decimal "previous_close_price", precision: 12, scale: 4
    t.integer "volume"
    t.decimal "percent_change", precision: 12, scale: 4
    t.decimal "price_change", precision: 12, scale: 4
    t.date "latest_trading_date"
    t.index ["symbol"], name: "symbol_unique_idx", unique: true
  end

  create_table "user_stock_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_stock_id", null: false
    t.integer "transaction_type", null: false
    t.integer "price_in_cents", null: false
    t.integer "shares_count", null: false
    t.datetime "transaction_timestamp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_amount_in_cents", default: 0, null: false
    t.index ["transaction_timestamp"], name: "index_user_stock_transactions_on_transaction_timestamp"
    t.index ["transaction_type"], name: "index_user_stock_transactions_on_transaction_type"
  end

  create_table "user_stocks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "stock_id"], name: "user_id_stock_id_unique_idx", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "username_unique_idx", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "daily_time_series_events", "stocks"
  add_foreign_key "intraday_time_series_events", "stocks"
  add_foreign_key "notifications", "users"
  add_foreign_key "orders", "user_stocks"
  add_foreign_key "relative_strength_index_analytics", "stocks"
  add_foreign_key "simple_moving_average_analytics", "stocks"
  add_foreign_key "stock_metrics", "metrics"
  add_foreign_key "stock_metrics", "stocks"
  add_foreign_key "user_stock_transactions", "user_stocks"
  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
