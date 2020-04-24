class CreateIntradayTimeSeriesEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :intraday_time_series_events, id: :uuid do |t|
      t.uuid :stock_id, null: false
      t.datetime :event_datetime, null: false
      t.decimal :open_price, null: false
      t.decimal :high_price, null: false
      t.decimal :low_price, null: false
      t.decimal :close_price, null: false
      t.integer :volume, null: false
      t.timestamps
    end

    add_foreign_key :intraday_time_series_events, :stocks
  end
end
