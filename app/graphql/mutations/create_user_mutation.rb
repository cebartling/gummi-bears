module Mutations
  class CreateUserMutation < BaseMutation
    field :user, Types::UserType, null: true
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::CreateUserInputType, required: true

    def resolve(input:)
      context = Users::CreateUserInteractor.call(
        first_name: input.first_name,
        last_name: input.last_name,
        username: input.username
      )

      result = {user: nil, message: context.message, errors: context.errors}
      if context.success?
        result = {user: context.user, message: context.message, errors: context.errors}
      end

      result
    end
  end
end
