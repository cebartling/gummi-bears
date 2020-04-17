module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :first_name, String, null: false, description: "User's first or given name"
    field :last_name, String, null: false, description: "User's last or family name"
    field :username, String, null: false, description: "User's username for authentication purposes"
    field :stocks, [UserStockType], null: false, description: "Stocks associated with this user"
  end
end
