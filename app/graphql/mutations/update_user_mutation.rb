module Mutations
  class UpdateUserMutation < BaseMutation
    field :user, Types::UserType, null: false

    argument :input, InputTypes::UpdateUserInputType, required: true

    def resolve(input:)
      # { post: ... }
    end
  end
end
