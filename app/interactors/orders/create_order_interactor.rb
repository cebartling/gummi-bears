module Orders
  class CreateOrderInteractor
    include Interactor

    def call
      context.message = 'order_create.success'
      context.errors = []

      user_stock = UserStock.find(context.user_stock_id)

      if user_stock
        context.order = Order.create(
          price_in_cents: context.price_in_cents,
          shares_count: context.shares_count,
          order_timestamp: context.order_timestamp,
          transaction_type: context.transaction_type,
          user_stock: user_stock
        )
        unless context.order
          context.fail!(message: 'order_create.failure',
                        errors: ["Unable to create a new order."])
        end
      else
        context.fail!(message: 'order_create.failure',
                      errors: ["Unable to find user stock."])
      end
    end

  end
end
