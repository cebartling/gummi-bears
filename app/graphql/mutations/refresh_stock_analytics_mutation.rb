module Mutations
  class RefreshStockAnalyticsMutation < BaseMutation
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::RefreshStockAnalyticsInputType, required: true

    def resolve(input:)
      # context = Users::UpdateUserInteractor.call(
      #   id: input.id,
      #   first_name: input.first_name,
      #   last_name: input.last_name,
      #   )
      #
      # result = {message: context.message, errors: context.errors}
      # if context.success?
      #   result = {message: context.message, errors: context.errors}
      # end
      #
      # result
    end
  end
end