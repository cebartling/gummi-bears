module Mutations
  class CreateUserStockTransactionMutation < BaseMutation
    field :user_stock_transaction, Types::UserStockTransactionType, null: false
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::CreateUserStockTransactionInputType, required: true

    def resolve(input:)
      context = Transactions::CreateUserStockTransactionInteractor.call(
        user_stock_id: input.user_stock_id,
        price_in_cents: input.price_in_cents,
        shares_count: input.shares_count,
        transaction_timestamp: input.transaction_timestamp,
        transaction_type: input.transaction_type
      )

      result = {
        user_stock_transaction: nil,
        message: context.message,
        errors: context.errors
      }

      if context.success?
        result = {
          user_stock_transaction: context.user_stock_transaction,
          message: context.message,
          errors: context.errors
        }
      end

      result
    end

  end
end
