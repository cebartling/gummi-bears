module Types
  class IntradayTimeSeriesEventType < Types::BaseObject
    field :id, ID, null: true
    field :stock, Types::StockType, null: false
    field :event_datetime, GraphQL::Types::ISO8601DateTime, null: false
    field :open_price, Float, null: false
    field :close_price, Float, null: false
    field :high_price, Float, null: false
    field :low_price, Float, null: false
    field :volume, Integer, null: false
  end
end


