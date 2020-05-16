module Types
  class SimpleMovingAverageAnalyticType < Types::BaseObject
    field :id, ID, null: true
    field :stock, Types::StockType, null: false
    field :interval_type, Types::IntervalType, null: false
    field :series_type, Types::SeriesType, null: false
    field :time_period, Integer, null: false
    field :simple_moving_average_entries, [Types::SimpleMovingAverageEntryType], null: false
  end
end
