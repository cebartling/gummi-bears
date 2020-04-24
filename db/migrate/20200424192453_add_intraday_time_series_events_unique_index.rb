class AddIntradayTimeSeriesEventsUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :intraday_time_series_events,
              [:stock_id, :event_datetime],
              unique: true,
              name: 'stock_id_and_event_datetime_unique_idx'
  end
end
