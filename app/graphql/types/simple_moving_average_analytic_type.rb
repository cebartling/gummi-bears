module Types
  class SimpleMovingAverageAnalyticType < Types::BaseObject
    field :id, ID, null: true
    field :stock, Types::StockType, null: false
    field :interval_type, Types::IntervalType, null: false
    field :series_type, Types::SeriesType, null: false
    field :time_period, Integer, null: false
  end
end
