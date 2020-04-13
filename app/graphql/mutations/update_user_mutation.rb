module Mutations
  class UpdateUserMutation < BaseMutation
    field :user, Types::UserType, null: false
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::UpdateUserInputType, required: true

    def resolve(input:)
      context = Users::UpdateUserInteractor.call(
        id: input.id,
        first_name: input.first_name,
        last_name: input.last_name,
      )

      result = {user: nil, message: context.message, errors: context.errors}
      if context.success?
        result = {user: context.user, message: context.message, errors: context.errors}
      end

      result
    end

  end
end
