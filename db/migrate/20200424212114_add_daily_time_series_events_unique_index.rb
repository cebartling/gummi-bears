class AddDailyTimeSeriesEventsUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :daily_time_series_events,
              [:stock_id, :event_date],
              unique: true,
              name: 'stock_id_and_event_date_unique_idx'
  end
end
