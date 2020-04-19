module Mutations
  class CreateUserMutation < BaseMutation
    field :user, Types::UserType, null: true
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::CreateStockInputType, required: true

    def resolve(input:)
      context = Users::CreateStockInteractor.call(
        name: input.name,
        symbol: input.symbol,
        user_id: input.user_id
      )

      result = {user: nil, message: context.message, errors: context.errors}
      if context.success?
        result = {user: context.user, message: context.message, errors: context.errors}
      end

      result
    end
  end
end

