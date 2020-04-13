module Types
  class UserStockType < Types::BaseObject
    field :id, ID, null: true
    field :user, Types::UserType, null: false
    field :stock, Types::StockType, null: false
  end
end
