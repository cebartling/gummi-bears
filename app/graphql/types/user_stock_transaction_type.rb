module Types
  class UserStockTransactionType < Types::BaseObject
    field :id, ID, null: true
    field :user_stock, Types::UserStockType, "User/stock association", null: false
    field :price_in_cents, Integer, "Transaction price for the stock", null: false
    field :shares_count, Integer, "Transaction share count", null: false
    field :transaction_timestamp, GraphQL::Types::ISO8601DateTime, "Transaction timestamp", null: false
    field :transaction_type, Types::TransactionType, "Transaction type: buy or sell", null: false
  end
end
