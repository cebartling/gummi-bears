module Stocks
  class CreateStockInteractor
    include Interactor

    def call
      context.message = 'stock_create.success'
      context.errors = []
      context.stock = Stock.find_by(symbol: context.symbol)
      unless context.stock
        begin
          context.stock = Stock.create!(name: context.name, symbol: context.symbol)
        rescue
          context.fail!(message: 'stock_create.failure',
                        errors: ["Unable to create stock '#{context.name}'."])
        end
      end

      context.user = User.find(context.user_id)
      unless context.user
        context.fail!(message: 'stock_create.failure',
                      errors: ["Unable to find user by identifier: [#{context.user_id}]."])
      end

      begin
        context.user_stock = UserStock.create!(stock: context.stock, user: context.user)
      rescue
        context.fail!(message: 'stock_create.failure', errors: ['Unable to create a new user/stock association.'])
      end
    end
  end
end
