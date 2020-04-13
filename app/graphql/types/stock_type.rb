module Types
  class StockType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: false
    field :symbol, String, null: false
  end
end
