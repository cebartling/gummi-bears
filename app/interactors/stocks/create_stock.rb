module Stocks
  class CreateStock
    include Interactor

    def call
      context.stock = Stock.create(name: context.name, symbol: context.symbol)
      unless context.stock
        context.fail!(message: 'stock_create.failure')
      end
    end
  end
end
