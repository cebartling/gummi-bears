module Types
  class StockType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: false
    field :symbol, String, null: false

    field :daily_time_series_events, [DailyTimeSeriesEventType], null: false do
      argument :limit, Integer, required: false, default_value: 20, prepare: ->(limit, ctx) {[limit, 100].min}
    end

    def daily_time_series_events(limit:)
      object.daily_time_series_events.limit(limit)
    end

    field :intraday_time_series_events, [IntradayTimeSeriesEventType], null: false do
      argument :limit, Integer, required: false, default_value: 20, prepare: ->(limit, ctx) {[limit, 100].min}
    end

    def intraday_time_series_events(limit:)
      object.intraday_time_series_events.limit(limit)
    end

    field :latest_daily_time_series_event, DailyTimeSeriesEventType, null: true do
    end

    def latest_daily_time_series_event
      object.daily_time_series_events.first
    end

    field :simple_moving_average_analytics, [SimpleMovingAverageAnalyticType],null: false do
    end

    def simple_moving_average_analytics
      object.simple_moving_average_analytics
    end
  end
end
