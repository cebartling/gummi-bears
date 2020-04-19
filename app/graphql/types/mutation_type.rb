module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUserMutation
    field :create_user, mutation: Mutations::CreateUserMutation
    field :create_stock, mutation: Mutations::CreateStockMutation
  end
end
