module Types
  class StockMetricType < Types::BaseObject
    field :id, ID, null: true
    field :stock, Types::StockType, null: false
    field :metric, Types::MetricType, null: false
  end
end
