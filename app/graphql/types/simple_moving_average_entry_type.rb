module Types
  class SimpleMovingAverageEntryType < Types::BaseObject
    field :id, ID, null: true
    field :simple_moving_average_analytic, Types::SimpleMovingAverageAnalyticType, null: false
    field :observation_value_in_cents, Integer, "Transaction price for the stock", null: false
    field :event_timestamp, GraphQL::Types::ISO8601DateTime, "Transaction timestamp", null: false
  end
end
