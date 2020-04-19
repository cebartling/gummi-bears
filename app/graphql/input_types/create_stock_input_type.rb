module InputTypes
  class CreateStockInputType < Types::BaseInputObject
    description "Attributes for creating a stock and associating it to a user"
    argument :name, String, "Company name associated with this stock", required: true
    argument :symbol, String, "Stock symbol", required: true
    argument :user_id, ID, "User's identifier", required: true
  end
end
