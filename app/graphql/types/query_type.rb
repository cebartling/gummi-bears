module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String,
          null: false,
          description: "An example field added by the generator"

    def test_field
      "Hello World!"
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
  end
end
