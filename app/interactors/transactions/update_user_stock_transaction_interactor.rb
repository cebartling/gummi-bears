module Transactions
  class UpdateUserStockTransactionInteractor
    include Interactor

    def call
      context.message = 'transaction_update.success'
      context.errors = []

      context.transaction = UserStockTransaction.find(context.user_stock_transaction_id)

      if context.transaction
        unless context.transaction.update(
          price_in_cents: context.price_in_cents,
          shares_count: context.shares_count,
          transaction_timestamp: context.transaction_timestamp,
          transaction_type: context.transaction_type,
        )
          context.fail!(message: 'stock_create.failure',
                        errors: ["Unable to create a new user stock transaction."])
        end
      else
        context.fail!(message: 'transaction_update.failure',
                      errors: ["Unable to find user stock transaction."])
      end
    end

  end
end
