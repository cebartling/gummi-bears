module Mutations
  class CreateUserMutation < BaseMutation
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    argument :input, InputTypes::CreateUserInputType, required: true

    def resolve(input:)
      context = Users::CreateUserInteractor.call(
        first_name: input.first_name,
        last_name: input.last_name,
        username: input.username
      )

      if context.failure?
        {
          user: nil,
          errors: [context.message]
        }
      else
        {
          user: context.user,
          errors: []
        }
      end
    end
  end
end
