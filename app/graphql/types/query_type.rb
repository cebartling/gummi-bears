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

  end
end
