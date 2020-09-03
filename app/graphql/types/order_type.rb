module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: true
    field :user_stock, Types::UserStockType, "User/stock association", null: false
    field :price_in_cents, Integer, "Order price for the stock", null: false
    field :shares_count, Integer, "Order share count", null: false
    field :total_amount_in_cents, Integer, "Total amount for the order", null: false
    field :order_timestamp, GraphQL::Types::ISO8601DateTime, "order timestamp", null: false
    field :transaction_type, Types::TransactionType, "Transaction type: buy or sell", null: false
    field :company_name, String, null: false
    field :stock_symbol, String, null: false
  end
end

