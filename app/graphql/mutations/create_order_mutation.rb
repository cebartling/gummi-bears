module Mutations
  class CreateOrderMutation < BaseMutation
    field :order, Types::OrderType, null: false
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::CreateOrderInputType, required: true

    def resolve(input:)
      context = Orders::CreateOrderInteractor.call(
        user_stock_id: input.user_stock_id,
        price_in_cents: input.price_in_cents,
        shares_count: input.shares_count,
        order_timestamp: input.order_timestamp,
        transaction_type: input.transaction_type
      )

      result = {
        order: nil,
        message: context.message,
        errors: context.errors
      }

      if context.success?
        result = {
          order: context.order,
          message: context.message,
          errors: context.errors
        }
      end

      result
    end

  end
end
