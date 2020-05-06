module Types
  class UserStockType < Types::BaseObject
    field :id, ID, null: true
    field :company_name, String, null: false
    field :stock_symbol, String, null: false
    field :user, Types::UserType, null: false
    field :stock, Types::StockType, null: false
    field :user_stock_transactions, [Types::UserStockTransactionType], "Stock transactions", null: false
  end
end
