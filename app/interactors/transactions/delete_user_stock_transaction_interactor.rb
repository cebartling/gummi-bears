module Transactions
  class DeleteUserStockTransactionInteractor
    include Interactor

    def call
      context.message = 'transaction_delete.success'
      context.errors = []

      rows_affected = UserStockTransaction.delete(context.user_stock_transaction_id)
      if rows_affected == 0
        context.fail!(message: 'transaction_delete.failure',
                      errors: ["Unable to delete an existing user stock transaction."])
      end
    end

  end
end