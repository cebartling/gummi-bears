module Transactions
  class CreateUserStockTransactionInteractor
    include Interactor

    def call
      context.message = 'user_stock_transaction_create.success'
      context.errors = []

      user_stock = UserStock.find(context.user_stock_id)

      if user_stock
        context.user_stock_transaction = UserStockTransaction.create(
          price_in_cents: context.price_in_cents,
          shares_count: context.shares_count,
          transaction_timestamp: context.transaction_timestamp,
          transaction_type: context.transaction_type,
          user_stock: user_stock
        )
        unless context.user_stock_transaction
          context.fail!(message: 'user_stock_transaction_create.failure',
                        errors: ["Unable to create a new user stock transaction."])
        end
      else
        context.fail!(message: 'user_stock_transaction_create.failure',
                      errors: ["Unable to find user stock."])
      end
    end

  end
end
