module Loaders
  class UserLoader < GraphQL::Batch::Loader
    # Define `initialize` to store grouping arguments, eg
    #
    #     Loaders::UserLoader.for(group).load(value)
    #
    # def initialize()
    # end

    # `keys` contains each key from `.load(key)`.
    # Find the corresponding values, then
    # call `fulfill(key, value)` or `fulfill(key, nil)`
    # for each key.
    def perform(keys)
    end
  end
end
