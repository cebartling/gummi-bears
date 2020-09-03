module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUserMutation
    field :create_user, mutation: Mutations::CreateUserMutation
    field :create_stock, mutation: Mutations::CreateStockMutation
    field :create_metric, mutation: Mutations::CreateMetricMutation
    field :create_user_stock_transaction, mutation: Mutations::CreateUserStockTransactionMutation
    field :create_order, mutation: Mutations::CreateOrderMutation
  end
end
