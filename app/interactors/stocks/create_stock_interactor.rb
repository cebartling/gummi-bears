module Stocks
  class CreateStockInteractor
    include Interactor

    def call
      context.stock = Stock.find_by(symbol: context.symbol)
      unless context.stock
        context.stock = Stock.create(name: context.name, symbol: context.symbol)
      end

      context.user = User.find(context.user_id)
      unless context.user
        context.fail!(message: 'stock_create.failure',
                      errors: ["Unable to find user by identifier: [#{context.user_id}]."])
      end

      context.user_stock = UserStock.create(stock: context.stock, user: context.user)
      unless context.user_stock
        context.fail!(message: 'stock_create.failure', errors: ['Unable to create a new user/stock association.'])
      end
    end
  end
end
