module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :metrics, [MetricType],
          null: true,
          description: 'Retrieve all metrics' do
    end

    def metrics()
      Metric.all
    end

    field :user_by_id, UserType,
          null: true,
          description: 'Find a user by ID' do
      argument :id, ID, required: true
    end

    def user_by_id(id:)
      User.find(id)
    end

    field :user_by_username, UserType,
          null: true,
          description: 'Find a user by the username' do
      argument :username, String, required: true
    end

    def user_by_username(username:)
      User.find_by_username(username)
    end

    field :user_by_auth_token, UserType,
          null: true,
          description: 'Find a user by the auth token' do
      argument :auth_token, String, required: true
    end

    def user_by_auth_token(auth_token:)
      User.find_by(auth_token: auth_token)
    end

    field :stock_by_id, StockType,
          null: true,
          description: 'Find a stock by its unique identifier' do
      argument :id, ID, required: true
    end

    def stock_by_id(id:)
      Stock.find(id)
    end

    field :stocks, StockType,
          null: true,
          description: 'Find a stock by its unique identifier' do
    end

    def stocks
      Stock.all
    end

    field :user_stock_by_id, UserStockType,
          null: true,
          description: 'Find a user/stock association by its unique identifier' do
      argument :id, ID, required: true
    end

    def user_stock_by_id(id:)
      UserStock.find(id)
    end

    field :simple_moving_average_analytic_by_stock_id, SimpleMovingAverageAnalyticType,
          null: true,
          description: "Find a stock's simple moving average analytic by interval, series and time period." do
      argument :stock_id, ID, required: true
      argument :interval_type, Types::IntervalType, required: true
      argument :series_type, Types::SeriesType, required: true
      argument :time_period, Integer, required: true
    end

    def simple_moving_average_analytic_by_stock_id(stock_id:, interval_type:, series_type:, time_period:)
      stock = Stock.find(stock_id)
      SimpleMovingAverageAnalytic.find_by(stock: stock,
                                          interval_type: interval_type,
                                          series_type: series_type,
                                          time_period: time_period)
    end

    field :symbol_search, [SymbolSearchResultType],
          null: true,
          description: 'Find stock symbols and companies matching' do
      argument :keywords, String, required: true
    end

    def symbol_search(keywords:)
      context = Stocks::SymbolSearchInteractor.call(keywords: keywords)
      context.matches
    end

  end
end
