# This file is used by Rack-based servers to start the application.
# require 'rack/cors'
require_relative 'config/environment'

# use Rack::Cors do
#   allow do
#     origins '*'
#     resource(
#       '*',
#       headers: :any,
#       methods: [:get, :patch, :put, :delete, :post, :options]
#     )
#   end
# end

run Rails.application
