module Types
  class SymbolSearchResultType < Types::BaseObject
    field :name, String, null: false
    field :symbol, String, null: false
  end
end
