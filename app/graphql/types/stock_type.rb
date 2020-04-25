module Types
  class StockType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: false
    field :symbol, String, null: false
    field :daily_time_series_events, [DailyTimeSeriesEventType], null: false
    field :intraday_time_series_events, [IntradayTimeSeriesEventType], null: false
  end
end
