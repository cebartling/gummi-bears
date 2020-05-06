module InputTypes
  class CreateUserStockTransactionInputType < Types::BaseInputObject
    description "Attributes for creating a user stock transaction"
    argument :user_stock_id, ID, "User stock identifier", required: true
    argument :price_in_cents, Integer, "Transaction price for the stock", required: true
    argument :shares_count, Integer, "Transaction share count", required: true
    argument :transaction_timestamp, GraphQL::Types::ISO8601DateTime, "Transaction timestamp", required: true
    argument :transaction_type, Types::TransactionType, "Transaction type: buy or sell", required: true
  end
end
