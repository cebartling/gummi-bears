module Mutations
  class CreateStockMutation < BaseMutation
    field :user_stock, Types::UserStockType, null: true
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::CreateStockInputType, required: true

    def resolve(input:)
      context = Stocks::CreateStockInteractor.call(
        name: input.name,
        symbol: input.symbol,
        user_id: input.user_id
      )

      result = {user_stock: nil, message: context.message, errors: context.errors}
      if context.success?
        result = {user_stock: context.user_stock, message: context.message, errors: context.errors}
      end

      result
    end
  end
end

